elem1 :: Eq a => a -> [a] -> Bool
elem1 a []  = False 
elem1 a (x:xs) 
     | a == x = True
     | otherwise = elem1 a xs
