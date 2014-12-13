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
nat8 :: Nat -> Integer
nat8 = \n -> length [c | c <- show n, c == 'S']
