twice :: (a -> a) -> a -> a 
twice f x = f(f x)

twice' :: (a -> a) -> a -> a
twice' f x = (f.f) x

inc1 = map (+1)


all1 :: (a -> Bool) -> [a] -> Bool
all1 p = and . map p

all2 :: (a -> Bool) -> [a] -> Bool
all2 p = not . any (not . p)

all3 :: (a -> Bool) -> [a] -> Bool
all3 p xs = foldl (&&) True (map p xs)

all4 :: (a -> Bool) -> [a] -> Bool
all4 p = foldr (&&) True . map p 

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p (x:xs)
           | p x = x : takeWhile' p xs
           | otherwise = []

takeWhile2 :: (a -> Bool) -> [a] -> [a]
takeWhile2 p = foldl (\ acc x -> if p x then x : acc else acc) []

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' p (x:xs) 
           | p x = dropWhile' p xs
           | otherwise = x:xs

dropWhile2 :: (a -> Bool) -> [a] -> [a]
dropWhile2 p = foldr (\ x acc -> if p x then acc else x : acc) []

map' :: (a -> b) -> [a] -> [b]
map' f = foldl (\ xs x -> xs ++ [f x]) []

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldl (\xs x -> if p x then xs ++ [x] else xs) []

dec2int :: [Integer] -> Integer
dec2int = foldl (\ x y -> 10 * x + y) 0

compose :: [a -> a] -> (a -> a)
compose = foldr (.) id

--sumsqreven = compose [sum, map (^2), filter even]

curry' :: ((a, b) -> c) -> a -> b -> c
curry' f = \ x y -> f (x,y)
