module Bumps_parser where

import ParserBase
import Bumps

------------------------------------------------------------------------------
----- AExp - concrete syntax (no left recursion)                              --
------------------------------------------------------------------------------
-----   A ::= T + A | T * A | T - A | T                                      --
-----   T ::= AExpVar | Num |  (A)                                           --
------------------------------------------------------------------------------

pAExpVar = do {x <- identifier; return (V x)}
pNum = do {i <- natural; return (Num i)}

-- these two functions build parsers for unary and binary operators
unaryOpParser opsym constructor p = do {symbol opsym;  y <- p;  return (constructor y) }
binaryOpParser opsym constructor p x  = do {symbol opsym;  y <- p;  return (constructor x y) }


pPlus = binaryOpParser "+" Plus pAExpr
pMult = binaryOpParser "*" Mult  pAExpr
pMinus = binaryOpParser "-" Minus pAExpr

-- if (p :: Parser a) then (wrapped p) parses a phrases surrounded by parentheses
wrapped :: Parser a -> Parser a
wrapped p = do {symbol "("; a <- p; symbol ")"; return a}

pAExpr :: Parser AExp
pAExpr  = do {t <- term; (pPlus t) +++ (pMult t) +++ (pMinus t) +++ (return t)}
            where term = pAExpVar +++ pNum +++ (wrapped pAExpr)

------------------------------------------------------------------------------
----- BExp                                                                  --
------------------------------------------------------------------------------
-----   B ::=  T && B |  T                                                  --
-----   T ::= "~" B | A "=" A | A ">" A |  A "<" A | (B)                              --
------------------------------------------------------------------------------

pEquals = do { a1 <- pAExpr; symbol "=="; a2 <- pAExpr; return (Equals a1 a2)}
pGreaterThan = do { a1 <- pAExpr; symbol ">"; a2 <- pAExpr; return (GreaterThan a1 a2)}
pLessThan = do { a1 <- pAExpr; symbol "<"; a2 <- pAExpr; return (GreaterThan a2 a1)}
pAnd = binaryOpParser "&&" And pBExpr 
pNot = unaryOpParser "not" Not pBExpr

pBExpr :: Parser BExp
pBExpr  = do {t <- term; (pAnd t) +++ (return t)}
            where term = pNot +++ pEquals +++ pGreaterThan +++ pLessThan +++ (wrapped pBExpr)


------------------------------------------------------------------------------
-- statements                                                         
------------------------------------------------------------------------------
--   S ::=  T ; S | T                                                 
--   T ::= L := E | if E then S1 else S2 fi | while E do S  | skip |
--             begin [Decls] in S end | Call I | (S)  
--
--  Note: [Decl] is a list fo Decl (Declaration) constructs.
-- 
--   Decl ::=  var x := A | proc p (var x) is S | proc p (x) is S | proc p(name x) is S | d1 ";" d2                                             
--
--         

pAssign = do {x <- identifier; symbol ":="; a <- pAExpr; return (Assign x a)}
pSkip = do {symbol "skip"; return Skip}
pIfThenElse = do{symbol "if";
                 b <- pBExpr;
                 symbol "then" ;
                 s1 <- pStm;
                 symbol "else";
                 s2 <- pStmNoSeq;   --  !! to have multiple statements after the "else" - use () or begin end. 
                 return (IfTheElse b s1 s2)}

pWhile = do {symbol "while";
             b <- pBExpr;
             symbol "do";
             s <- pStmNoSeq;    -- !! to have multiple statements after the "do" - use () or begin end.
             return (While b s)}

pBegin = do {symbol "begin";
             d <- do{d' <- pDecl; symbol ";"; return d'}  +++ (return DEmpty);
             s <- pStm;
             symbol "end";
             return (Begin d s)} 

-- pRefArg, pValArg, pNameArg, pArg :: Parser Arg 
pPointerArg = do {symbol "&";  x <- identifier;  return (Pointer x)}
pAexpArg = do {a <- pAExpr;  return (Aexp a)}

pArg = pPointerArg +++ pAexpArg

pCall = do {symbol "call";
            p <- identifier;
            symbol "(";
            x <- pArg;
            symbol ")";
            return (Call p x)}

pSeq s1 = binaryOpParser ";" Seq pStm s1

pStmParen = do {symbol "(";
                s <- pStm;
                symbol ")";
                return s}

pStmNoSeq = pStmParen +++ pAssign +++ pSkip +++ pIfThenElse +++ pWhile +++ pBegin +++ pCall

pStm = do {t <- term; (pSeq t) +++ return t}
        where term = pStmParen +++ pAssign +++ pSkip +++ pIfThenElse +++ pWhile +++ pBegin +++ pCall

---------------------------------------------------------------------------------------------------------------
----- Declarations - limited the epsilon complexities by using a list of decls in the Begin constructor for Stm --
---------------------------------------------------------------------------------------------------------------
-----   Var ::=  var x := A;
-----   Proc ::= proc p is S;
-----   Decls ::= [(Var + Proc)*]
---------------------------------------------------------------------------------------------------------------


pDecl :: Parser Decl
pDecl = do {t <- term; (pDSemi t) +++ (return t)} 
        where term = pVar +++ pProc 

pDSemi :: Decl -> Parser Decl
pDSemi  = binaryOpParser ";" DSemi pDecl 

pVar :: Parser Decl
pVar = do {symbol "var"; x <- identifier; symbol ":="; a <- pAExpr; return (VarD x a)}


-- used by pRoc to get the CallType
pCTy key const = do {symbol key; return const}
pCallType = (pCTy "name" CBN) +++ (pCTy "var" CBR) +++ (return  CBV)


pProc :: Parser Decl
pProc = do {symbol "proc";
            p <- identifier;
            symbol "(";
            cty <- pCallType;
            y <- identifier;
            symbol ")";
            symbol "is";
            body <- pStmNoSeq;
            return (Proc p cty y body)}


