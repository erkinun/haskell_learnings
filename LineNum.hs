module LineNum where 

import System.IO

main = do
     input <- readFile "input.txt"
     (putStrLn.countLines) input

countLines :: String -> String
countLines str = (show.length.lines) str
