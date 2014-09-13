module FileIO where

import System.IO

main = do 
    input <- readFile "files/input.txt"
    --(putStrLn.reverse) input
    writeFile "files/output.txt" (reverse input)

