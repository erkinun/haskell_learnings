halve xs = splitAt (length xs `div` 2) xs

halve2 xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
            where n = length xs

halve3 xs = splitAt (length xs `div` 2) -- does not work 

halve4 xs = (take n xs, drop n xs) 
            where n = length xs `div` 2

halve5 xs = splitAt (div (length xs) 2) xs

halve6 xs = splitAt (length xs / 2) xs -- does not work
