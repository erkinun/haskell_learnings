data Tree a = Leaf | Node (Tree a) a (Tree a)

fibs = 0 : 1 : [x + y | (x,y) <- zip fibs (tail fibs)]

--fib n = last (take n fibs)
fib n = fibs !! n 

largeFib = head (dropWhile (<= 1000) fibs)

repeatTree :: a -> Tree a
repeatTree x = Node t x t 
           where t = repeatTree x
