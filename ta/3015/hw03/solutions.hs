module Solutions where

-- problem 1 (5 pts)
oscMap :: (a -> b) -> (a -> b) -> [a] -> [b]

oscMap f1 f2 xs = oscMap' f1 f2 xs 0

oscMap' f1 f2 [] _ = []
oscMap' f1 f2 (x:xs) idx = 
    if idx `mod` 2 == 0 
        then (f1 x):(oscMap' f1 f2 xs (idx + 1)) 
        else (f2 x):(oscMap' f1 f2 xs (idx + 1))

-- problem 2 (5 pts)
data List a = Nil | Cons a (List a) deriving Show
app :: List a -> List a -> List a

app Nil l = l
app l Nil = l
app (Cons a l1) l2 = (Cons a (app l1 l2))

-- problem 3 (10 pts)
list2int :: [Int] -> Int 
list2int xs = foldr (\acc x -> acc + x * 10) 0 (reverse xs)

-- problem 4 (50 pts total)
data  Tree a = Leaf | Node a (Tree a) (Tree a) deriving  Show

-- 4a (5 pts)
size :: Tree a -> Int

size Leaf = 0
size (Node _ t1 t2) = 1 + size t1 + size t2

-- 4b (5 pts)
insert :: Ord a => a -> Tree a -> Tree a

insert a (Leaf) = (Node a Leaf Leaf)
insert a (Node b t1 t2)
    | a <= b    = (Node b (insert a t1) t2)
    | otherwise = (Node b t1 (insert a t2))

-- 4c (5 pts)
squash :: Tree a -> [a]

squash Leaf = []
squash (Node a Leaf Leaf) = [a] -- redundant
squash (Node a l1 l2) = squash l1 ++ [a] ++ squash l2

-- 4d (5 pts)
unsquash :: Ord a => [a] -> Tree a

unsquash xs = foldr unsquashLambda Leaf xs

unsquashLambda :: Ord a => a -> Tree a -> Tree a
unsquashLambda x Leaf = Node x Leaf Leaf
unsquashLambda x (Node a t1 t2)
    | x < a     = Node a (unsquashLambda x t1) t2
    | otherwise = Node a t1 (unsquashLambda x t2)

-- 4e (5 pts)
treesort :: Ord a => [a] -> [a]

treesort xs = squash (treesort' xs Leaf)

treesort' [] t = t
treesort' (x:xs) t = treesort' xs (insert x t)

-- 4f (10 pts)
foldt :: (a -> b -> b -> b -> b) -> b -> Tree a -> b

foldt f acc (Leaf) = acc
foldt f acc (Node a t1 t2) = f a acc (foldt f acc t1) (foldt f acc t2)


-- 4g (5 pts)
treesum :: Num a => Tree a -> a

treesum t1 = foldt (\a acc l r -> a + acc + l + r) 0 t1

-- 4h (10 pts)
instance (Eq a, Num a) => Eq (Tree a) where
    t1 == t2 = treesum t1 == treesum t2

-- 4i EC (5 pts)
depth :: Tree a -> Int

depth Leaf = 0
depth t = foldt (\_ _ lacc racc -> (max lacc racc) + 1) 0 t