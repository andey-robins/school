module BIPs_parser where

import ParserBase
import BIPs

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
-----   T ::= "~" B | A "=" A | A ">" A |  (B)                              --
------------------------------------------------------------------------------

pEquals = do { a1 <- pAExpr; symbol "=="; a2 <- pAExpr; return (Equals a1 a2)}
pGreaterThan = do { a1 <- pAExpr; symbol ">"; a2 <- pAExpr; return (GreaterThan a1 a2)}
pAnd = binaryOpParser "&&" And pBExpr 
pNot = unaryOpParser "~" Not pBExpr

pBExpr :: Parser BExp
pBExpr  = do {t <- term; (pAnd t) +++ (return t)}
            where term = pNot +++ pEquals +++ pGreaterThan +++ (wrapped pBExpr)


------------------------------------------------------------------------------
-- statements                                                         
------------------------------------------------------------------------------
--   S ::=  T ; S | T                                                 
--   T ::= L := E | if E then S1 else S2 fi | while E { S } | skip |
--             begin [Decls] in S end | Call I | (S)  
--
--  Note: [Decl] is a list fo Decl (Declaration) constructs.
-- 
--   Decl ::=  var x := A; | proc p is S;                                             
--
--  We've also added a comment notation. Anything on a line after "--" is ignored.
------------------------------------------------------------------------------
-- Note: Added the keyword "in" to the begin construct so parses are
--       unambigious. Since ";" marks the end of a proc declaration and
--       is also the sequencing operator for statements, the following is
--       ambigious  "begin proc p is skip; skip; skip end"  is p defined as
--       one or two skips? Could make a rule that proc declarations always
--       only have one statement in the body - possibly surrounded by
--       parentheses, but that seems less natural than just adding "in".
--       Similarly, ending an "if" statement with "fi" marks the end of the
--       else clause making parsing easier and not requiring all multi statement
--       else clauses to be enclosed in "(" ")".
--         

pAssign = do {x <- identifier; symbol ":="; a <- pAExpr; return (Assign x a)}
pSkip = do {symbol "skip"; return Skip}
pIfThenElse = do{symbol "if";
                 b <- pBExpr;
                 symbol "then" ;
                 s1 <- pStm;
                 symbol "else";
                 s2 <- pStm;
                 symbol "fi";
                 return (IfTheElse b s1 s2)}

pWhile = do {symbol "while";
             b <- pBExpr;
             symbol "{";
             s <- pStm;
             symbol "}";
             return (While b s)}

pBegin = do {symbol "begin";
             decls <- pDecls;        -- <- similarly for proc declarations 
             symbol "in";
             s <- pStm;
             symbol "end";
             return (Begin decls s)} 

pCall = do {symbol "call";
            p <- identifier;
            return (Call p)}

pSeq s1 = binaryOpParser ";" Seq pStm s1

pStmParen = do {symbol "(";
                s <- pStm;
                symbol ")";
                return s}

pStm = do {t <- term; (pSeq t) +++ return t}
        where term = pStmParen +++ pAssign +++ pSkip +++ pIfThenElse +++ pWhile +++ pBegin +++ pCall

---------------------------------------------------------------------------------------------------------------
----- Declarations - limited the epsilon complexities by using a list of decls in the Begin constructor for Stm --
---------------------------------------------------------------------------------------------------------------
-----   Var ::=  var x := A;
-----   Proc ::= proc p is S;
-----   Decls ::= [(Var + Proc)*]
---------------------------------------------------------------------------------------------------------------

pDecls :: Parser [Decl]
pDecls = many (pVar +++ pProc)

pVar :: Parser Decl
pVar = do {symbol "var"; x <- identifier; symbol ":="; a <- pAExpr; symbol ";"; return (VarD x a)}

pProc :: Parser Decl
pProc = do {symbol "proc"; p <- identifier; symbol "is"; s <- pStm; symbol ";"; return (Proc p s)}

