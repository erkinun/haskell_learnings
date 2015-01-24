
push :: [a] -> a -> [a]
push [] a = [a]
push xs a = a : xs

pop :: [a] -> (a, [a])
pop [] = error "empty"
pop (x:xs) = (x, xs)
