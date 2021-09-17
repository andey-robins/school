condense :: Int -> [a] -> [a]
condense _ [] = []
condense n (x:xs)
  | n <= 0    = x:xs
  | null xs   = []
  | otherwise = condense (n - 1) (init xs)
