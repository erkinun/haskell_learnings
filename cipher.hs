import Data.Char

cipher :: [Char] -> Int -> [Char]
cipher ys 0 = ys
cipher [] n = []
cipher (x:xs) n = rotate x n : cipher xs n

rotate :: Char -> Int -> Char
rotate x 0 = x 
rotate x n = chr (rotateInt (ord x) n)

rotateInt :: Int -> Int -> Int
rotateInt i 0 = i
rotateInt i n | i == 122  = rotateInt 97 (n-1)
              | otherwise = rotateInt (i+1) (n-1)

