module TupleFunction where

addElem :: Num a => (a,a) -> a
addElem (x ,y) = x + y

fst3 :: (a,b,c) -> a
fst3 (x, _, _) =  x

lst3 :: (a, b, c) -> c
lst3 (_, _, z) = z