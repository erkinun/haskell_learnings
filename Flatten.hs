
flatten' :: [[a]] -> [a]
flatten' [] = []
flatten' (xs:xss) = xs ++ flatten' xss
