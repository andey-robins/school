-- COSC 3015 - Fall 2019
-- Jacob Tuttle
-- Homework 05

-- problem 1.1
-- filter (tail recursive)

filter_l acc p [] = acc
filter_l acc p (x:xs) = if (p x)
        then filter_l (acc ++ [x]) p xs
        else filter_l acc p xs

-- problem 1.2
-- reverse (tail recursive)

rev_l r [] = r
rev_l r (x:xs) = rev_l ([x] ++ r) xs

-- problem 1.3
-- various functions implemented with foldr or foldl
-- included are expected values and their tested results

-- 1.3a map
-- fold_map (==2) [1..3] should evaluate to [False, True, False]
-- out: => [False,True,False]
fold_map f [] = []
fold_map f (x:xs) = (f x) : foldr (\x xs -> (f x):xs) [] xs

-- 1.3b filter
-- fold_filter (<3) [1..8] should evaluate to [1, 2]
-- out: => [1,2]
fold_filter f [] = []
fold_filter f xs = foldr (\x xs -> if (f x) then x:xs else xs) [] xs

-- 1.3c Data.List.partition
--fold_partition (`elem` "aeiou") "Hello World" should evaluate to ("eoo", "Hll Wrld")
-- out: => ("eoo","Hll Wrld")
fold_partition f [] = ("", "")
fold_partition f xs = foldl (\(inc, out) x -> if (f x) then (inc ++ [x], out) else (inc, out ++ [x])) ("", "") xs
