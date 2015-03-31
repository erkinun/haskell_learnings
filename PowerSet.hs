
power :: [a] -> [[a]]
power xs = powerInner xs [[]]

powerInner :: [a] -> [[a]] -> [[a]]
powerInner [] xss = xss
powerInner (x:xs) xss = powerInner xs ((attach x xss) ++ xss)
                        where attach x xss = map (\xs -> x:xs) xss
