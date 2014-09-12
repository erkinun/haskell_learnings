module Main where

main = do 
     putStrLn "quit the program? y/n"
     ans <- getLine
     if ans /= "y" then do
        putStrLn "still not quitting"
        main
     else return () 
