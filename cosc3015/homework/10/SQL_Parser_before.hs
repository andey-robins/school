{--

November 19. 2019
James Caldwell
updated to add a number of utility parsers.


November 15, 2019

James Caldwell
Department of Computer Science
University or Wyoming

(COSC 3015) Functional Programming
Base code for homework problem on parsing.

Complete the parser for the

--}


module SQL_Parser where

import ParserBase

--------------------------------------------------------------------------------
-- Here are some data-types to represent the AST for a subset of SQL.
--------------------------------------------------------------------------------

data TableName = TableName String | Anonymous [FieldName] deriving (Eq,Show)
data FieldName = FieldName String | FieldReference TableName String deriving (Eq, Show)
data Type = BOOL | INT | STRING | NULL Type deriving (Eq,Show)
data Values = BoolV Bool | IntV Int | StringV String  deriving (Eq,Show)
data Tuple = T [Values] deriving (Show,Eq)
data Expression =
      C Int
      | FN FieldName
      | Expression `Or` Expression
      | Expression `And` Expression
      | Not Expression
      | Expression `Equal` Expression
      | Expression `LessThan` Expression
      | Expression `Plus` Expression
      | Expression `Times` Expression
    deriving (Show,Eq)

data Table =
      CreateTable TableName [(String, Type)]
      | InsertInto Table Tuple
      | JoinOn Table Table Expression
      | SelectFrom [FieldName] TableName
      | SelectFromWhere [FieldName] TableName Expression
      | Table TableName
      | Sequence Table Table
      | Go Table Table
    deriving (Eq,Show)

{-- SQL Concrete Syntax

First - a few notational conveniences for writing down the concrete syntax.

[<exp>]* is the set of all sequences of syntactic elements from exp
(including the empty sequence).  It is implemented by the many parser
already presented.
--}

star :: Parser a -> Parser [a]
star = many

{-- We will write "[<p>]+{sep}" to denote a sequence of 1 or more elements parsed by a parser p and
seperated by a string (call it sep) can be parsed by the following.
--}

plusSep p sep = do {x <- p; xs <- many (do {symbol sep; x<- p; return x}); return (x:xs)}

{--  Here are a couple of example uses of plusSep.

    [<nat>]+{,}
*SQLParser> parse (plusSep nat ",") "12,  11,  14, 21"
[([12,11,14,21],"")]

    [<nat>]+{,}
*SQLParser> parse (plusSep nat ",") "12,  11,  14, 21  22, 23  24, 25"
[([12,11,14,21],"  22, 23  24, 25")]

    [<identifier>]+{;}
*SQLParser> parse (plusSep identifier ";") "foo; goo;  boo;coo (soo,too)"
[(["foo","goo","boo","coo"],"(soo,too)")]

Here's a more complicated one:

    ["(" <identifier> "," <identifier> ")"]+{;}
*SQLParser> parse (plusSep (do {symbol "("; i<- identifier; symbol ","; j <- identifier; symbol ")"; return (i,j)})  ";") "(foo,goo);(boo,coo);(soo,too)"
[([("foo","goo"),("boo","coo"),("soo","too")],"")]

--}


{--
********************************************************************************
Mini-SQL Concrete Syntax
********************************************************************************

<Table> ::= CREATE TABLE <TableName> ([[<FieldName> <Type>]]+{,} )
            | INSERT INTO <Table> <Tuple>
            | JOIN ON <Table> <Table> <Expression>
            | SELECT <FieldName> FROM <Table>
            | SELECT <FieldName> FROM <Table> WHERE <Exp>
            | <TableName>
            | <Table> ; <Table>
            | ( <Table> )

  <Exp> ::= <Int>
            | <FieldName>
            | <Exp> OR <Exp>
            | <Exp> AND <Exp>
            | NOT <Exp>
            | <Exp> = <Exp>
            | <Exp> < <Exp>
            | <Exp> + <Exp>
            | <Exp> * <Exp>
            | ( <Exp> )

<Tuple> ::= "(" [[Values]]+{,} ")"
<Values> ::= <Bool> | <Int> | <String>
<Bool> ::= TRUE | FALSE
<Int> ::= *** use the parser for integers  ***  { ... -2, -2, 0 , 1, 2, 3, ... }
<String> ::= "'" <character> "'"
<TableName> ::= <identifier>
<FieldName> ::= <identifier> | <TableName> . <identifier>
<Type> = BOOL | INT | STRING | CHAR Int | NULL <Type>
<identifier> ::=  *** use the parser for indentifiers ***

--}

{--
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Exp Parser
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

The grammar parsed here has had left recursion eliminated by the
algorithm described in https://en.wikipedia.org/wiki/Left_recursion

--}

-- NOTE: thenPossibly - expects the parser p2 to return e1 if it otherwise would fail.
thenPossibly :: Parser a -> (a -> Parser a) -> Parser a
thenPossibly p1 p2 = do e1 <- p1
                        e2 <- p2 e1
                        return e2

expression = (integerExp `thenPossibly` expression')
             +++ (fieldNameExp `thenPossibly` expression')
             +++ (notExp `thenPossibly` expression')
             +++ (parens expression `thenPossibly` expression')

parens p = do symbol "("
              x <- p
              symbol ")"
              return x

integerExp = do k <- integer
                return (C k)

fieldNameExp = do fn <- fieldName
                  return (FN fn)

fieldName = do {tn <- tableName; char '.'; field <- identifier; return (FieldReference tn field)}
             +++ do{i <- identifier; return (FieldName i)}

notExp = do {symbol "NOT"; e <- expression; return (Not e)}

expression' e = orExp e +++ andExp e +++ eqExp e +++ ltExp e +++ plusExp e +++ timesExp e +++ return e

binExp sym cons e1 = do {symbol sym;
                         e2 <- expression;
                         e3 <- expression' e2;
                         return (cons e1 e3)}

orExp  = binExp "OR" Or
andExp  = binExp "AND" And
eqExp  = binExp "=" Equal
ltExp = binExp "<" LessThan
plusExp = binExp "+" Plus
timesExp = binExp "*" Times


{-
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Table Parser
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

You need to implement the table parser.  First step is to fix the concrete grammar
for tables so that it has no left recursion.  Use the algorithm
presented here:  https://en.wikipedia.org/wiki/Left_recursion

Next step is to write the parser.

Check as you go -- saving unit tests for final proof that your parser works.


-}

-- Here are a number of supporting parsers.

fieldType :: Parser Type
fieldType = do {t <- (many1 upper);
                case t of
                     "BOOL" -> return BOOL
                     "INT" -> return INT
                     "STRING" -> return STRING
                     "NULL" -> do {t <- fieldType; return (NULL t)}
                     _     -> zero}

tuple :: Parser Tuple
tuple = do {symbol "("; vs <- plusSep values ","; symbol ")"; return (T vs)}

values :: Parser Values
values = boolv +++ integerv +++ stringv
boolv = do {b <- boolean ; return (BoolV b)}
     where boolean = do {symbol "TRUE"; return True} +++ do{symbol "FALSE"; return False}
integerv = do {k <- integer; return (IntV k)}
stringv = do {whiteSpace; char '\''; s <- many1 (sat (/= '\'')); char '\''; return (StringV s)}

tableName :: Parser TableName
tableName = do{symbol "("; fns <- plusSep fieldName ","; symbol ")"; return (Anonymous fns)} +++ do {i <- identifier; return (TableName i)}

tableNameTable :: Parser Table
tableNameTable = do {tn <- tableName;
                     return (Table tn)}

-- -- main parsers
table =  (tableTab `thenPossibly` table')
         +++ (parens table `thenPossibly` table')

createTab t = do {symbol "CREATE TABLE";
                  n <- tableName;
                  symbol "(";
                  f <- lowers;
                  t2 <- fieldType;
                  symbol ")";
                  return (CreateTable n [(f, t2)])}

tableTab = do n <- tableName
              return (Table n)

table' t = insertTab t +++ joinTab t +++ selectFromTab t +++ selectFromWhereTab t +++ sequenceTab t +++ createTab t +++ return t
-- don't forget to add goTab back in once you figure out what that does

insertTab t1 = do {symbol "INSERT INTO";
                   t2 <- table;
                   u <- tuple;
                   return (InsertInto t2 u)}

joinTab t = do {symbol "JOIN ON";
                t2 <- table' t;
                t3 <- table' t;
                e <- expression;
                return (JoinOn t2 t3 e)}

selectFromTab t = do {symbol "SELECT";
                      f <- fieldName;
                      symbol "FROM";
                      n <- tableName;
                      return (SelectFrom [f] n)}

selectFromWhereTab t = do {symbol "SELECT";
                           f <- fieldName;
                           symbol "FROM";
                           n <- tableName;
                           symbol "WHERE";
                           e <- expression;
                           return (SelectFromWhere [f] n e)}

sequenceTab t = do {t2 <- table;
                    symbol ";";
                    t3 <- table;
                    return (Sequence t2 t3)}

--goTab t = binTab ""
