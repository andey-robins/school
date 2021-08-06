module ParserBase where

import Control.Applicative hiding (many)

newtype Parser a  = MkP(String ->  [(a,String)])


parse :: Parser a -> String -> [(a,String)]
parse (MkP f) s  = f s    

fullParse :: (Show a) => Parser a -> String -> Either a String
fullParse p s = case parse p s of
                   [] -> Right "fullParse: parse failure"
                   [(x,"")] -> Left x
                   [x,more] -> Right ("fullParse: incomplete parse [" ++ show x ++ ", " ++ show more ++ "] ")

fParse (MkP f) s = (fst . head) $ f s    

instance Functor Parser where
 -- fmap :: (a -> b) -> Parser a -> Parser b
   fmap g p = MkP (\inp -> case parse p inp of
                          []        -> []
                          [(v,out)] -> [(g v,out)])

instance Applicative Parser where
--   -- pure :: a -> Parser a
   pure v = MkP (\inp -> [(v,inp)])

--   -- <*> :: Parser (a -> b) -> Parser a -> Parser b
   pg <*> px = MkP (\inp -> case parse pg inp of
                             []        -> []
                             [(g,out)] -> parse (fmap g px) out)

instance Monad Parser where

-- (>>=) :: Parser a -> ( a -> Parser b) -> Parser b
    p >>= q = MkP f
      where f s = [(y,s'')|(x,s') <- parse p s, (y,s'') <- parse (q x) s']


 --                   MkP(\i -> case (parse p i) of
 --                             [] -> []
 --                             [(v,out)] -> parse (f v) out)


 -- return :: a -> Parser a
    return v = MkP(\ i -> [(v,i)])

item :: Parser Char
item = MkP(\i -> case i of
                 [] -> []
                 (x:xs) -> [(x,xs)])

zero :: Parser a
zero = MkP(\i -> [])

fail :: Parser a
fail = zero

                 
p :: Parser (Char,Char)
p =  do x <- item 
        item 
        y <- item
        return (x,y)

sat :: (Char -> Bool) -> Parser Char
sat p = do x <- item
           if p x then return x else zero

digit  :: Parser Char
digit  = sat (\c -> c `elem` ['0' .. '9'])

lower  :: Parser Char
lower  =  sat (\c -> c `elem` ['a' .. 'z'])

upper  :: Parser Char
upper  = sat (\c -> c `elem` ['A' .. 'Z'])

char      :: Char -> Parser Char
char x = sat (==x)

string :: String -> Parser String
string [] = return []
string (x:xs) = do char x
                   string xs
                   return (x:xs)

--- combining parsers
plus :: Parser a -> Parser a -> Parser a
p `plus` q = MkP f 
   where f s = parse p s ++ parse q s

(+++) :: Parser a -> Parser a -> Parser a
p +++ q = MkP(\i -> case parse p i of
                      [] -> parse q i
                      m -> m)


---  zero `plus` p = p
---  p `plus` zero = p
---  p `plus` (q `plus` r) = (p `plus` q) `plus` r
---  (p ++ q) >>= r = (p >>= r) `plus` (q >>= r)


lowers :: Parser String
lowers = do {c <- lower; cs <- lowers; return (c : cs)} +++ return ""

letter :: Parser Char
letter = (lower +++ upper)

alphanum :: Parser Char
alphanum = (letter +++ digit)


many :: Parser a -> Parser [a]
many p = many1 p +++ return []

many1 :: Parser a -> Parser [a]
many1 p = do v <- p
             vs <- many p
             return (v:vs) 

lowers1 :: Parser String
lowers1 = many lower 

ident :: Parser String
ident = do x <- lower
           xs <- many alphanum
           return (x:xs)

nat :: Parser Int
nat = do xs <- many1 digit
         return (read xs)

int :: Parser Int
int = do {string "-"; k <- nat; return (-k)} +++ nat

space :: Parser ()
space = do many (char ' ')
           return ()

whiteSpace :: Parser ()
whiteSpace = do {many (char ' ' +++ char '\n' +++ char '\t' +++ char '\r'); return ()}

token :: Parser a -> Parser a
token p = do whiteSpace
             v <- p
             whiteSpace
             return v

identifier :: Parser String
identifier = token ident

natural :: Parser Int
natural = token nat

integer :: Parser Int
integer = token int

symbol :: String -> Parser String
symbol xs = token (string xs)


natlist :: Parser [Int]
natlist = do symbol "["
             n <- natural
             ns <- many (do symbol ","
                            natural)
             symbol "]"
             return (n:ns)


parseFile ::  Parser a -> String -> IO [(a, String)]
parseFile p file =
  do txt  <- readFile file
     return (parse p txt)

fullParseFile :: Show a => Parser a -> FilePath  -> IO a
fullParseFile p file =
    do {txt  <- readFile file;
        case (fullParse p txt) of
          Left x -> return x
          Right m -> error ("Incomplete Parse: ("++ file ++ ")"  ++ m) }
