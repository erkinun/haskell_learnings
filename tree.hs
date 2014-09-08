
data Tree = EmptyTree | Node Int Tree Tree deriving (Show, Read, Eq)

singleton :: Int -> Tree
singleton val = Node val EmptyTree EmptyTree

insert :: Int -> Tree -> Tree
insert val EmptyTree = singleton val
insert val (Node nodeVal left right) 
    | val == nodeVal = (Node val left right)
    | val > nodeVal = Node nodeVal left (insert val right)
    | otherwise = Node nodeVal (insert val left) right

add :: Tree -> Int 
add EmptyTree = 0
add (Node val left right) = val + (add left) + (add right)

