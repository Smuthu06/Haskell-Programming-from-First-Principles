module Excersie where

import Data.Char


caps :: [Char]
caps = filter isUpper "HrEiLxLaO"

camelCase :: [Char] -> [Char]
camelCase (x:xs) = (toUpper x) : xs

upper :: String -> String
upper str = map toUpper  str

head' :: [Char] -> Char
head' str = toUpper . head $ str