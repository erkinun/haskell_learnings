module Main where

mingle :: String -> String -> String
mingle _ [] = []
mingle [] _ = []
mingle (x:xs) (y:ys) = x:y: mingle xs ys


main = do
    first <- getLine
    second <- getLine
    putStrLn $ mingle first second
