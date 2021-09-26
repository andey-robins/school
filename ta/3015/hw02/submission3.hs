module HW2 where
import Prelude hiding (zipWith)

replicate n x = [n | n <- x]
expunge n [] = []
expunge n (x:xs) = if x == n then expunge n xs else [x] ++ expunge n xs
zipWith :: (a -> b -> c) -> [a]->[b]->[c]
zipWith f (a:as) (b:bs) = f a b : zipWith f as bs
zipWith _ _      _      = []
euclid n x = if n == x then x else if n > x then euclid (n - x) x else euclid n (x - n)
isort n [] = [n]
isort n (l:ls)
    | n <= l = n : l : ls
    | otherwise = l : (isort n ls)
merge [] x = x
merge x [] = x
merge (x:xs) (y:ys) | y < x     = y : merge (x:xs) ys
merge (x:xs) (y:ys) | otherwise = x : merge xs (y:ys)
fsthalf :: [a] -> [a]
fsthalf xs = take (length xs `div` 2) xs
sndhalf :: [a] -> [a]
sndhalf xs = drop (length xs `div` 2) xs
msort [] = []
msort [x] = [x]
msort xs = merge (msort (fsthalf xs)) (msort (sndhalf xs))
