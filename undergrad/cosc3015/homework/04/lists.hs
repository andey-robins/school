-- imports used in automated testing below
import Data.List
import Data.Maybe

-- 1. member
-- member:: a -> [a] -> Bool
-- member x xs is True iff x == some element in the list

member y [] = False
member y (x:xs) = y==x || (member y xs)


-- 2. pull
-- pull:: Int -> [a] -> [a]
-- pull k xs returns a list of the first k elements of the list
-- if k > length then pull k xs == xs

pull 0 xs = []
pull _ [] = []
pull k (x:xs) = if (k < 1)
                    then []
                    else x:(pull (k - 1) xs)


-- 3. chop
-- chop:: Int -> [a] -> [a]
-- chop k xs returns a list just like xs except it is missing the first k elements
-- if k > length then chop k xs = []
-- if k == 0 then chop k xs = xs

chop _ [] = []
chop 0 xs = xs
chop k (_:xs) = chop (k - 1) xs


-- 4. get
-- get:: Int -> [a] -> Maybe a
-- if x is the kth element of the list xs, then get k xs = Just x
-- if k < 0 or k+1 > len xs then get k xs = Nothing

get 0 (x:xs) = Just x
get _ [] = Nothing
get k (x:xs) = if (k < 0)
                then Nothing
                else get (k - 1) xs

-- 5. find1
-- find1:: (a -> Bool) -> [a] -> Maybe a
-- find an element in a list satisfying the predicate, if there is one
-- if an element is there, then find1 p xs = Just x
-- if there is no element find1 p xs = Nothing

find1 _ [] = Nothing
find1 p (x:xs) = if (p x)
                    then Just x
                    else find1 p xs

-- 6. find2
-- find2:: (a -> Bool) -> [a] -> [a]
-- returns a list of all elements in a list that satisfy the predicate

find2 _ [] = []
find2 p (x:xs) = if (p x)
                    then x:(find2 p xs)
                    else find2 p xs

--
-- Testing
--

-- provided testing functions
test1_pull k xs =  let vs = pull k xs in
     if k >= length xs then (vs, vs == xs) else (vs, True)

test4_get p k xs =
    case (find1 p xs) of
        Just x -> let j = length xs in
                        (Just x,  (get k xs == get (j - (k+1)) (reverse xs)) && 0 <= k && k < j )
        Nothing -> (Nothing, True)

-- custom testing functions
-- Note: a result of True indicates that a function has the desired behavior
test_member x xs =  let m = member x xs in
    if Data.List.any (==x) xs then m else False

test2_pull k xs = let p = pull k xs in
    if ((p == []) == (k <= 0)) then True else False

test_pullAndChop k xs = if ((pull k xs ++ chop k xs) == xs)
                            then True
                            else False

test1_get = let p = get 0 [] in
    if (isNothing p)
        then True
        else False

test2_get xs = let p = get 0 xs in
    if (p == Just (head xs))
        then True
        else False

test3_get k xs = let p = get k xs in
    if (0 <= k && k < length xs)
        then (p == Just (head (chop k xs)))
        else False

test_chop xs = let p = chop 0 xs in
    if (p == xs)
        then True
        else False

test1_find1 p = let f = find1 p [] in
    if (isNothing f)
        then True
        else False

test2_find1 p xs =
    case (find1 p xs) of
        Just x -> Data.List.any p xs
        Nothing -> True

test3_find1 p xs =
    case (find1 p xs) of
        Just x -> ((p x) && (elem x xs))
        Nothing -> True

test1_find2 p = let f = find2 p [] in
    if (f == [])
        then True
        else False

test2_find2 p xs = let f = find2 p xs in
    if (f == (filter p xs))
        then True
        else False
