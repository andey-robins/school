Eq a => a -> a

TypeClass Foldable

Foldable a => [a] -> a

Foldable 

-- sum foldr
foldr (+) 0 [1..3]
foldr _ acc [] = acc
foldr f acc x:xs = foldr f (f acc x) xs

-- cons
foldr (:) [] [1..3]
foldr _ acc [] = acc
foldr f acc x:xs = foldr f (f acc x) xs

f acc x -> acc'

(:) [1..3] 4 = [1..4]

-- const length(list) => {
    -- console.log()
-- }

(\acc x -> x:acc)

-- accumulator
(\acc x -> x:acc) [1..3] 4 = [1..4]
foldr (\acc x -> x + acc) [] [1..3]

sum [1,2,3] === 1+(2+(3+0)) = 6

\acc l r -> acc + l + r

instance (Eq a, Num a) => Eq (Tree a) where
    t1 == t2 = true



[1..5]

app []
app (x:xs)

data List a = Nil | Cons a (List a)

app Nil = 
app (Cons x xs) (Cons y ys) = 


[1..3]
(Cons 1 (Cons 2 (Cons 3 Nil)))




foldr (\) acc [1..5]

foldr (+) 0 [1..3]

foldr (+) 0 1:[2,3] = foldr (+) (0+1) [2,3]
foldr (+) 1 2:[3] = foldr (+) (1+2) [3]
foldr (+) 3 3:[] = foldr (+) (3+3) []
foldr (+) 6 [] = 

--base
foldr _ acc [] = acc
-- recursive case
foldr f acc x:xs = foldr f (f acc x) xs

(\x y -> x + y)

-- type: f in foldr (a -> a -> a)
(\acc x -> acc + x)

foldr (\acc x -> acc + x) 0 [1..3] == foldr (+) 0 [1..3]

list2int

acc -> has a correct value
x -> nth

base Leaf => 
insert i (Node a l r)





data Number = Zero | Succesor (Number) deriving Show

2 == Succesor (Succesor (Zero))
1 == Succesor (Zero)


numSum xs = numSum' xs

numSum' Zero = 0
numSum' Succesor s = numSum' s + 1


f xs = bar (f' xs t)

f' [] t = t
f' (x:xs) t = foo xs t