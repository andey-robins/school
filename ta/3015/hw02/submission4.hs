module HW2 where

replicate :: Int -> a -> [a]
replicate a x = [x | _ <- [1..a]]

expunge :: Eq a => a -> [a] -> [a]
expunge a xs = [x | x <- xs, x /= a ]


zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f xs ys = [f x y | (x,y) <- zip xs ys]


euclid :: Int -> Int -> Int
euclid a b | a == b = a
           | a < b = euclid a (b-a)
           | otherwise = euclid (a-b) a

insert :: Ord a => a -> [a] -> [a]
insert a [] = []
insert a (x:xs) 
    | a > x = x : insert a xs
    | a < x = a : x:xs

isort :: Ord a => [a] -> [a]
isort [] = []
isort xs = insert (head xs) (isort (tail xs))

merge :: Ord a => [a] -> [a] -> [a]
merge []     xs      = xs
merge xs      []     = xs
merge (x:xs) (y:ys)
    | x < y     = x : merge xs (y:ys)
    | x > y     = y : merge (x:xs) ys
    | otherwise = x : y : merge xs ys

msort :: Ord a => [a] -> [a]
msort xs
    | length xs == 1 = xs
    | otherwise = merge (isort (drop (length xs `div` 2) xs)) (isort (take (length xs `div` 2) xs))
      

