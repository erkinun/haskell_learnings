fact :: Int -> Int
fact 1 = 1 
fact n = n * fact (n-1)

addL :: Integer -> Integer -> Integer
addL = \x y -> x + y

--let list  = [1,2,3,4,5]
sumList :: [Int] -> Int
sumList [] = 0
sumList xs = foldl (\a b -> a + b) 0 xs

mapLen :: [String] -> [Int]
mapLen [] = []
mapLen (x:xs) = (length x) : mapLen xs

mapLen1 :: [String] -> [Int]
mapLen1 xs = map (\x -> length x) xs
