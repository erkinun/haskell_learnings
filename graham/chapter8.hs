putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs

putStrLn1 [] = putChar '\n'
putStrLn1 xs = putStr' xs >> putStrLn1 ""

putStrLn2 [] = putChar '\n'
putStrLn2 xs = putStr' xs >> putChar '\n'

putStrLn3 [] = putChar '\n'
putStrLn3 xs = putStr' xs >>= \ x -> putChar '\n'

--putStrLn4 [] = putChar '\n'
--putStrLn4 xs = putStr' xs >> \ x -> putChar '\n'

putStrLn5 [] = putChar '\n'
putStrLn5 xs = putStr' xs >> putStr' "\n"

--dont work
--putStrLn6 [] = putChar '\n'
--putStrLn6 xs = putStr' xs >> putStrLn6 "\n"

--dont work
--putStrLn7 [] = putChar '\n'
--putStrLn7 xs = putStrLn7 xs >> putStr' "\n"

getLine' = get ""

get :: String -> IO String
get xs 
    = do x <- getChar
         case x of 
           '\n' -> return xs
           _ -> get (xs ++ [x])





















