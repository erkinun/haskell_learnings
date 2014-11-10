--m hede 0 = 1 
--m hede n = m * (m hede (n-1))

exponent' m 0 = 1 
exponent' m n = m * (exponent' m (n-1))

and' [] = True
and' (b:bs) = b && (and' bs)

cancat [] = []
cancat (xs:xss) = xs ++ cancat xss
