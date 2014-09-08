import Data.Char

length15 :: String -> Bool
length15 pass 
         | (length pass) >= 15 = True
         | otherwise = False

hasProperty :: String -> (Char -> Bool) -> Bool
hasProperty pass pred= length (filter pred pass) > 0

hasUpper :: String -> Bool
hasUpper pass = hasProperty pass isUpper

hasLower :: String -> Bool
hasLower pass = hasProperty pass isLower

hasNumbers :: String -> Bool
hasNumbers pass = hasProperty pass isNumber 

strong :: String -> Bool
strong pass = (length15 pass) && (hasUpper pass) && (hasNumbers pass) && (hasLower pass)


