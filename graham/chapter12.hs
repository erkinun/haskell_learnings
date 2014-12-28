drop' :: Int -> [a] -> [a]
drop' n [] = []
drop' 0 xs = xs
drop' n (_:xs) = drop' (n-1) xs
