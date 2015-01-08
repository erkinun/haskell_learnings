module Main where

import Data.Char

compr :: String -> String
compr str = tupleList2Str $ strToTuple str []


tuple2Str :: (Char, Int) -> String
tuple2Str (x,1) = [x]
tuple2Str (x,i) = x:[(intToDigit i)]

tupleList2Str :: [(Char, Int)] -> String
tupleList2Str [] = []
tupleList2Str (t:ts) = (tuple2Str t) ++ tupleList2Str ts

incTuple :: (Char, Int) -> Char -> (Char, Int)
incTuple (x,i) y 
         | x == y = (x, i+1)
         | otherwise = (x,i)

createTuple :: Char -> (Char, Int)
createTuple x = (x,1)

strToTuple :: String -> [(Char, Int)] -> [(Char, Int)]
strToTuple [] tuples = tuples
strToTuple (s:ss) [] = strToTuple ss $ [createTuple s]
strToTuple (s:ss) ts 
           | s == lastChar = strToTuple ss $ (init ts) ++ [incTuple lastTuple s]
           | otherwise = strToTuple ss $ ts ++ [createTuple s] 
           where lastChar = fst $ last ts
                 lastTuple = last ts



main = do
    str <- getLine
    putStrLn $ compr str
