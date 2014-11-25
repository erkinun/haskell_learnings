mergeList :: [a] -> [a] -> [a]
mergeList xs [] = xs
mergeList [] ys = ys
mergeList (x:xs) (y:ys) = [x] ++ [y] ++ mergeList xs ys
