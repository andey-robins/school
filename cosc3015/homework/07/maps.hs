-- COSC 3015 - Fall 2019
-- Jacob Tuttle
-- Homework 07

-- Exercise 1 - ftmap
-- a map function over BTree
data BTree a = Empty | Fork a (BTree a) (BTree a) deriving (Eq,Show,Ord)

ftmap :: (a -> b) -> BTree a -> BTree b
ftmap f Empty = Empty
ftmap f (Fork a lTree rTree) = Fork (f a) (ftmap f lTree) (ftmap f rTree)

-- Helper functions for building trees
buildBT [] = Empty
buildBT xs = let
    (left,(r:right)) =
        splitAt ((length xs - 1) `div` 2) xs in
            Fork r (buildBT left) (buildBT right)

-- Exercise 2 - conversion to functor
-- Define the function ftmap as a functor
instance Functor BTree where
    fmap f Empty = Empty
    fmap f (Fork a lTree rTree) = Fork (f a) (fmap f lTree) (fmap f rTree)

-- Helper functions for exercise 2
testId :: (Eq a) => (BTree a) -> Bool
testId bt = fmap id bt == bt
testComp :: (Eq c) => (b -> c) -> (a -> b) -> BTree a -> Bool
testComp f g bt =
    (fmap f  .  fmap g) bt ==  fmap (f . g) bt

-- BTree sum functions
sumBT, prodBT :: Num a => BTree a -> a

sumBT Empty = 0
sumBT (Fork x l r) = (sumBT l) + (x + (sumBT r))

prodBT Empty = 1
prodBT (Fork x l r) = (prodBT l) * ( x * (sumBT r))

flattenBT Empty = []
flattenBT (Fork x l r) = (flattenBT l) ++ ( [x] ++ (flattenBT r))

-- Exercise 3 - foldr on trees
-- write a fold function for the BTrees
foldrBT :: (a -> b -> b) -> b -> (BTree a) -> b
foldrBT f i Empty = i
foldrBT f i (Fork a lTree rTree) = f a (foldrBT f (foldrBT f i lTree) rTree)
