--Main.hs

module Main where

import Data.Char

-- |This is the main function
main = do
     putStrLn "What's your password"
     pass <- getLine
     putStrLn ("Hi " ++ (isStrong(strong pass)))

-- |Checks length
length15 :: String -> Bool
length15 pass 
         | (length pass) >= 15 = True
         | otherwise = False

hasProperty :: String -> (Char -> Bool) -> Bool
hasProperty pass pred= length (filter pred pass) > 0

-- |Checks if any upper chars exist
hasUpper :: String -> Bool
hasUpper pass = hasProperty pass isUpper

-- |Checks if any lower chars exist
hasLower :: String -> Bool
hasLower pass = hasProperty pass isLower

-- |Checks if there are any numbers
hasNumbers :: String -> Bool
hasNumbers pass = hasProperty pass isNumber 

strong :: String -> Bool
strong pass = (length15 pass) && (hasUpper pass) && (hasNumbers pass) && (hasLower pass)

isStrong :: Bool -> String
isStrong True = "password is OK"
isStrong False = "password is WEAK"
