--list slide
--let name = "erkin"
-- :t name
--name :: [Char]
-- head name
--'m'
-- tail name
--"onitise"
-- init name
--"monitis"
-- last name
--'e'

--comprehension slide
--[x | x <- [1..10], x < 5]
--[c | c <- "erkin", c > 'g']
--[(2 * x) + 1 | x <- [1..10], x < 5]
-- let nouns = ["hobo","frog","pope"]  
-- let adjectives = ["lazy","grouchy","scheming"]  
-- [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns] 

--function slide 
fact :: Int -> Int
fact 1 = 1 
fact n = n * fact (n-1)

addL :: Integer -> Integer -> Integer
addL = \x y -> x + y

--guards and where clause
{-
  bmiTell :: (RealFloat a) => a -> a -> String  
  bmiTell weight height  
    | bmi <= skinny = "You're underweight, you emo, you!"  
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"  
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"  
    | otherwise     = "You're a whale, congratulations!"  
    where bmi = weight / height ^ 2  
          skinny = 18.5  
          normal = 25.0  
          fat = 30.0  
-}

--higher order slides
--let list  = [1,2,3,4,5]
sumList :: [Int] -> Int
sumList [] = 0
sumList xs = foldl (\a b -> a + b) 0 xs

mapLen :: [String] -> [Int]
mapLen [] = []
mapLen (x:xs) = (length x) : mapLen xs

mapLen1 :: [String] -> [Int]
mapLen1 xs = map (\x -> length x) xs

--composition slide
firstname :: [String] -> String
firstname [] = ""
firstname (x:xs) = x

lenName :: String -> Int
lenName [] = error "empty string"
lenName str = length str

-- lenName . firstname $ ["erkin", "unlu"]

{-
  main = do  
    putStrLn "Hello, what's your name?"  
    name <- getLine  
    putStrLn ("Hey " ++ name ++ ", you rock!")  
-}
