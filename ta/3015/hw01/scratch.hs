condense n xs
  | null xs = []
  | n <= 0 = xs
  | n >= length xs = []
  | otherwise = reverse (take (length xs - n - n) (reverse (take (length xs - n) xs)))
