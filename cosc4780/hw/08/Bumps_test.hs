
module Bumps_tests where

import Control.Monad
import ParserBase
import Data.Map
import Bumps_parser
import Bumps  hiding ((!))

-- Here's a pretty printer for stores.

display :: Sto -> IO ()
display sto =  putStrLn "store: \n" >> iter 0
  where current_max = (sto!maxStoreSize)
        iter k = if (k < current_max) then
                        do {putStrLn ("Loc " ++ (show k) ++ ": " ++ (show (sto!k))); iter (k + 1)}
                 else
                        do {putStrLn ("nextLoc: " ++ (show (sto!nextLoc)));
                            putStrLn ("maxStoreSize: " ++ (show (sto!maxStoreSize)))}

test_stm prog = do {s <- fullParseFile pStm prog;
                display (big_step_stm env0 (s, s0))}

test file =
     do {lns <- readFile file;
         putStrLn ("file: " ++ file ++ "\n");
         putStrLn lns;
         case (parse pStm lns) of
             [] -> putStrLn "parse error"
             ((stm,[]):_) -> display (big_step_stm env0 (stm, s0))
             ((stm,leftOver):_) -> putStrLn("Incomplete Parse: string remaing to be parsed: " ++ leftOver)
        }


    
