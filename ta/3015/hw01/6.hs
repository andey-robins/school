pad :: Int -> a -> [a] -> [a]
pad n x xs
  | n <= 0    = xs
  | otherwise = pad (n - 1) x (x:xs ++ [x])
