module Pattern_Match where

safeHead       :: [a] -> Maybe a 
safeHead []    = Nothing
safeHead (x:_) = Just x

safeTail        :: [a] -> Maybe [a]
safeTail []     =  Nothing
safeTail (x:[]) = Nothing
safeTail (x:xs) = Just xs