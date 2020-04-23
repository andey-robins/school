

module BIPs_tests where

import ParserBase
import Data.Map
import BIPs
import BIPs_parser

-- Here's a pretty printer for stores.

display :: Sto -> IO ()
display sto =  putStrLn "store: \n" >> iter 0
  where current_max = sto!maxStoreSize
        iter k = if (k < current_max) then
                        do {putStrLn ("Loc " ++ (show k) ++ ": " ++ (show (sto!k))); iter (k + 1)}
                 else
                        do {putStrLn ("nextLoc: " ++ (show (sto!nextLoc)));
                            putStrLn ("maxStoreSize: " ++ (show (sto!maxStoreSize)))}

test_big_step_stm file =
     do {lns <- readFile file;
         putStrLn ("file: " ++ file ++ "\n");
         putStrLn lns;
         s <- fullParseFile pStm file;
         display (big_step_stm (stm0, env0) ((s, env0), s0))}
