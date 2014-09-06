head1 :: [a] -> a
head1 (x:xs) = x
head1 [x] = x 
head1 [] = error "empty list"
