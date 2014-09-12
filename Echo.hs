module Echo where

main = do 
     putStrLn "Say something"
     said <- getLine
     putStrLn $ "You said: " ++ said
