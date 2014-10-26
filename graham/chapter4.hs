import Prelude hiding ((||), (&&))

halve xs = splitAt (length xs `div` 2) xs

halve2 xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
            where n = length xs

halve3 xs = splitAt (length xs `div` 2) -- does not work 

halve4 xs = (take n xs, drop n xs) 
            where n = length xs `div` 2

halve5 xs = splitAt (div (length xs) 2) xs

--halve6 xs = splitAt (length xs / 2) xs -- does not work

safetail xs = if null xs then [] else tail xs

safetail1 [] = []
safetail1 (_:xs) = xs

safetail2 xs 
          | null xs = []
          | otherwise = tail xs
      
safetail3 xs = tail xs -- does not work`
safetail3 [] = []

safetail4 [] = []
safetail4 xs = tail xs
             
safetail5 [x] = [x] -- does not work
safetail5 (_:xs) = xs

safetail6  = \ xs -> 
             case xs of 
               [] -> []
               (_ : xs) -> xs

False || c = c 
True || _ = True

a && b = if a then b else False

remove :: Int -> [a] -> [a]
remove n xs = take n xs ++ drop (n+1) xs

funct :: Int -> [a] -> [a]
funct x xs = take (x+1) xs ++ drop x xs
