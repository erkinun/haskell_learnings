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

interact' f 
          = do input <- getLine'
               putStrLn1 (f input)

--sequence_1 [] = return ()
--sequence_1 (m:ms) = m >> \ _ -> sequence_1 ms

sequence_2 [] = return ()
sequence_2 (m:ms) = (foldl (>>) m ms) >> return ()

sequence_3 ms = foldl (>>) (return ()) ms

sequence_4 [] = return ()
sequence_4 (m:ms) = m >> sequence_4 ms

sequence_5 [] = return ()
sequence_5 (m:ms) = m >>= \_ -> sequence_5 ms

--sequence_6 ms = foldr (>>=) (return ()) ms

sequence_7 ms = foldr (>>) (return ()) ms

sequence_8 ms = foldr (>>) (return []) ms

seq1 [] = return []
seq1 (m:ms) 
     = m >>= 
         \ a ->
           do as <- seq1 ms
              return (a:as)

--seq2 ms = foldr func (return ()) ms
--  where 
--    func :: (Monad m) => m a -> m [a] -> m [a]
--    func m acc 
--      = do x <- m 
--           xs <- acc
--           return (x:xs)

--seq3 ms = foldr func (return []) ms
--          where
--            func :: (Monad m) => m a -> m [a] -> m [a]
--            func m acc = m : acc

--seq4 [] = return []
--seq4 (m:ms) = return (a : as)
--    where
--        a <- m
--        as <- seq4 ms

seq5 ms = foldr func (return []) ms
          where
            func :: (Monad m) => m a -> m [a] -> m [a]
            func m acc 
                 = do x <- m
                      xs <- acc
                      return (x:xs)

--dont work
--seq6 [] = return []
--seq6 (m:ms) 
--    = m >> 
--      \ a -> 
--          do as <- seq6 ms
--             return (a:as)

seq7 [] = return []
seq7 (m:ms) = m >>= \a -> 
              do as <- seq7 ms
                 return (a:as)

seq8 [] = return []
seq8 (m:ms) 
     = do a <- m
          as <- seq8 ms
          return (a:as)

monadify chr = putStr chr
monadify2 = getChar

mapM1 f as = seq1 (map f as)

mapM2 f [] = return []
mapM2 f (a:as) 
      = f a >>= \b -> mapM2 f as >>= \bs -> return (b:bs)

--dont work
mapM3 f as = sequence_2 (map f as)

--dont work
mapM4 f [] = return []
mapM4 f (a:as) 
      = f a >>= \b -> mapM4 f as >> \bs -> return (b:bs)

--dont compile
--mapM5 f [] = return []
--mapM5 f (a:as) = 
--    do 
--      f a -> b
--      mapM5 f as -> bs
--      return (b:bs)

mapM6 f [] = return []
mapM6 f (a:as)
      = do b <- f a
           bs <- mapM6 f as
           return (b:bs)
