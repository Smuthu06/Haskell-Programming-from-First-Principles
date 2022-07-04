module WordToNumber where

import Data.List (intersperse)

digitTOWord :: Int -> String
digitTOWord n 
    | n == 1    = "One"
    | n == 2    = "Two"
    | n == 3    = "Three"
    | n == 4    = "Four"
    | n == 5    = "Five"
    | n == 6    = "Six"
    | n == 7    = "Seven"
    | n == 8    = "Eight"
    | n == 9    = "Nine"
    | otherwise = "Zero"

digits :: Int -> [Int]
digits n  = (x)
    where x  
            | n < 10 = [n]
            | otherwise = (mod n 10) : (digits (div n 10))

wordNumber :: Int -> String
wordNumber n = concat . intersperse "-" .map digitTOWord . digits $ n

