replicate1 n a = [a | _ <- [1..n]]

pyths n = [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

find :: (Eq a) => a -> [(a,b)] -> [b]
find k t = [v | (k', v) <- t, k == k']

positions :: (Eq a) => a -> [a] -> [Int]
positions x xs = find x (zip xs [0..n])
                 where n = length xs - 1

scalarproduct xs ys = sum [x * y | (x, y) <- xs `zip` ys] 

riffle xs ys = concat [[x,y] | (x,y) <- xs `zip` ys]

divides num div = (mod num div) == 0

divisors x = [d | d <- [1..x], x `divides` d]
