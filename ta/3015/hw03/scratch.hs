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