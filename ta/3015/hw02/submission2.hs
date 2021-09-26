module HW2 where


-- Assignment 2

-- Problem 1 -- Replicate
replicate :: Int -> a -> [a]
replicate n v
    | n == 0 = []
    | otherwise = [ v | x <- [1..n]]


-- Problem 2 -- Expunge

expunge :: (Eq a) => a -> [a] -> [a]
expunge _ [] = []
expunge n xs = [ x | x <- xs, (x /= n)]


-- Problem 3 -- ZipWidth

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f xs ys = [f x y | (x,y) <- zip xs ys]




-- Problem 4 -- Euclid

euclid :: Int -> Int -> Int
euclid x y
    | x == y = x
    | x > y = euclid (x - y) y
    | y > x = euclid x (y - x)


-- Problem 5 -- Insert and Insertion Sort

insert :: Ord a => a -> [a] -> [a]
insert n [] = [n]
insert n (x:xs) 
    | n < x = n : xs
    | otherwise = insert n xs


isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)


-- Problem 6 -- Merge and Merge Sort 
merge :: Ord a => [a] -> [a] -> [a]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) 
    | x < y = x : (merge xs (y:ys))
    | y <= x = y : (merge (x:xs) ys)


msort :: Ord a => [a] -> [a]
msort [] = []
msort xs
    | (length xs == 1) = xs
    | otherwise = merge (msort(fst (halve xs))) (msort(snd (halve xs)))


halve :: [a] -> ([a], [a])
halve xs = splitAt(length xs `div` 2) xs
