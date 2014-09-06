isPal :: Eq a => [a] -> Bool
isPal [] = False
isPal xs = isPalInner xs xs 

isPalInner :: Eq a => [a] -> [a] -> Bool
isPalInner [] [] = True
isPalInner _ [] = False
isPalInner [] _ = False
isPalInner xs ys = (head xs == last ys) && isPalInner (tail xs) (init ys)
