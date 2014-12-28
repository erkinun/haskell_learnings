
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton val = Node val EmptyTree EmptyTree

insert :: Ord a => a -> Tree a -> Tree a
insert val EmptyTree = singleton val
insert val (Node nodeVal left right) 
    | val == nodeVal = (Node val left right)
    | val > nodeVal = Node nodeVal left (insert val right)
    | otherwise = Node nodeVal (insert val left) right

add :: Num a => Tree a -> a
add EmptyTree = 0
add (Node val left right) = val + (add left) + (add right)

