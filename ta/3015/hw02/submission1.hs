module HW2 where

import Data.List
import System.IO

concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

replicate' 0 _ = []
replicate' n v = v : replicate' (n-1)v

