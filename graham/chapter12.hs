drop' :: Int -> [a] -> [a]
drop' n [] = []
drop' n (_:xs) = drop' (n-1) xs
drop' 0 xs = xs

