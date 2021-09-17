safetailA xs = 
  if xs == []
  then []
  else tail xs

safetailB xs
  | null xs   = []
  | otherwise = tail xs

safetailC [] = []
safetailC (_:xs) = xs
