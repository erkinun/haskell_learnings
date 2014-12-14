import Data.List
import Data.Char
import Unsafe.Coerce

data Nat = Zero | Succ Nat deriving Show

natToInteger Zero = 0
natToInteger (Succ n) = natToInteger n + 1

natToInteger1 (Succ n) = natToInteger n + 1
natToInteger1 Zero = 0

--does not terminate
natToInt3 n = natToInt3 n

nat4 (Succ n) = 1 + nat4 n
nat4 Zero = 0

--does not calculate correct
nat5 Zero = 1
nat5 (Succ n) = (1 + nat5 n) - 1

nat6 = head . m 
       where m Zero = [0]
             m (Succ n) = [sum [x | x <- (1 : m n)]]

nat7 :: Nat -> Integer 
nat7 = \ n -> genericLength [c | c <- show n, c == 'S']

--does not compile
--nat8 :: Nat -> Integer
--nat8 = \n -> length [c | c <- show n, c == 'S']

--n+k pattern is not used
int1 0 = Zero
int1 (n+1) = Succ (int1 n)

--will not terminate
int2 0 = Zero
int2 n = (Succ (int2 n))

--gibberish check again
int3 n = product [(unsafeCoerce c) :: Integer | c <- show n]

--infinite loop
int4 n = int4 n 

--n+k pattern not allowed
int5 (n+1) = Succ (int5 n)
int5 0 = Zero

--n+k pattern
int6 (n+1) = let m = int6 n in Succ m
int6 0 = Zero

--int7 :: Integer -> Nat
--int7 = head . m
--     where {
--           ; m 0 = [0]
--           ; m (n+1) = sum [ [x | x <- (1 : m n)]]
--           }

--does not compile
--int8 :: Integer -> Nat
--int8 = \n -> genericLength [c | c <- show n, isDigit c]

add1 Zero n = n 
add1 (Succ m) n = Succ (add1 n m)

add2 (Succ m) n = Succ (add2 n m)
add2 Zero n = n

--wont work
add3 Zero n = Zero 
add3 (Succ m) n = Succ (add3 m n)

--wont work
add4 (Succ m) n = Succ (add4 m n)
add4 Zero n = Zero

--wont work
add5 n Zero = Zero 
add5 n (Succ m) = Succ (add5 n m)

add6 n (Succ m) = Succ (add6 n m)
add6 n Zero = Zero

add7 n Zero = n
add7 n (Succ m) = Succ (add7 m n)

add8 n (Succ m) = Succ (add8 m n)
add8 n Zero = n

--non exhaustive
mult1 Zero Zero = Zero 
mult1 m (Succ n) = add8 m (mult1 m n)

mult2 m Zero = Zero
mult2 m (Succ n) = add8 m (mult2 m n)

--wrong calculate
mult3 m Zero = Zero
mult3 m (Succ n) = add8 n (mult3 m n)

--goes to infinity
mult4 m Zero = Zero 
mult4 m n = add8 m (mult4 m (Succ n))

data Tree = Leaf Integer | Node Tree Integer Tree deriving Show

--let testTree = (Node (Node (Leaf 1) 3 (Leaf 5)) 7 (Node (Leaf 9) 10 (Leaf 11)))
testTree2 = Node (Node (Leaf 1) 3 (Leaf 5)) 7 (Node (Leaf 9) 10 (Leaf 11))

occurs1 m (Leaf n) = m == n
occurs1 m (Node l n r) 
        = case compare m n of 
               LT -> occurs1 m l 
               EQ -> True
               GT -> occurs1 m r

--wrong style
occurs2 m (Leaf n) = m == n
occurs2 m (Node l n r) 
        = case compare m n of 
               LT -> occurs2 m r 
               EQ -> True
               GT -> occurs2 m l

--wrong types
--occurs3 m (Leaf n) = compare m n
--occurs3 m (Node l n r) 
--        = case compare m n of 
--               LT -> occurs3 m l 
--               EQ -> True
--               GT -> occurs3 m r

--wrong result
occurs4 m (Leaf n) = m == n
occurs4 m (Node l n r) 
        = case compare m n of 
               LT -> occurs4 m l 
               EQ -> False
               GT -> occurs4 m r

occurs5 m (Leaf n) = m == n
occurs5 m (Node l n r)
        | m == n = True
        | m < n = occurs5 m l
        | otherwise = occurs5 m r

--wrong result
occurs6 m (Leaf n) = m == n
occurs6 m (Node l n r)
        | m == n = True
        | m > n = occurs6 m l
        | otherwise = occurs6 m r

--wont compile
--occurs7 :: Integer -> Tree -> Bool
--occurs7 m n = m == n 
--occurs7 m (Node l n r)
--        | m == n = True
--        | m < n = occurs7 m l 
--        | otherwise = occurs7 m r

data Tree2 = Leaf2 Integer | Node2 Tree2 Tree2 deriving Show

balance :: [Integer] -> Tree2
halve xs = splitAt (length xs `div` 2) xs
balance [x] = Leaf2 x 
balance xs = Node2 (balance ys) (balance zs)
        where (ys, zs) = halve xs
