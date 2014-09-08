maP :: (a -> b) -> [a] -> [b]
maP f [] = []
maP func (x:xs) = (func x) : (maP func xs)

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 f [] = []
filter1 f (x:xs) 
       | (f x) == True = x : (filter1 f xs)
       | otherwise = filter1 f xs

foldL :: (a -> b -> b) -> b -> [a] -> b
foldL f result [] = result 
foldL f r (x:xs) = (foldL f (f x r) xs)
