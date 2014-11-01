
factors n = [x | x <- [1..n], n `mod` x == 0 ]

prime n = factors n == [1,n]

primes :: Int -> [Int]
primes n = [x | x <- [1..n], prime x]

concat1 xss = [x | xs <- xss, x <- xs]
