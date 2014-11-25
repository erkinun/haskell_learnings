
type Parser a = String -> [(a, String)]

return' :: a -> Parser a
return' v = \inp -> [(v, inp)]

failure :: Parser a 
failure = \inp -> []

item :: Parser Char
item = \inp -> case inp of
                 [] -> []
                 (x:xs) -> [(x,xs)]

parse :: Parser a -> String -> [(a, String)]
parse p inp = p inp

--hede :: Parser (Char, Char)
--hede = do x <- fst $ head $ item
--          item
--          y <- fst $ head $ item
--          Main.return (x,y)


(+++) :: Parser a -> Parser a -> Parser a
p +++ q = \inp -> case parse p inp of
                    [] -> parse q inp
                    [(v, out)] -> [(v,out)]
                

sat :: (Char -> Bool) -> Parser Char
sat p = do x <- item
           if p x then return' x else failure
