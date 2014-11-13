import Prelude hiding ((!!))

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n a = a : (replicate' (n-1) a)

(!!) :: [a] -> Int -> a
(x:_) !! 0 = x
(_:xs) !! n = xs !! (n-1)

elem' :: Eq a => a -> [a] -> Bool
elem' _ [] = False
elem' n (x:xs)
      | n == x = True
      | otherwise = elem' n xs
                
merge' :: Ord a => [a] -> [a] -> [a]
merge' [] ys = ys
merge' xs [] = xs
merge' (x:xs) (y:ys) 
       = if x <= y then x : merge' xs (y:ys) else y : merge' (x:xs) ys

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

msort :: Ord a => [a] -> [a]
msort [] = []
msort [x] = [x]
msort xs = merge' (msort half1) (msort half2)
    where (half1, half2) = halve xs
 
