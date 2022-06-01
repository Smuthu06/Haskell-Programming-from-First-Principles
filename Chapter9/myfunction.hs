module MyFunc where
import GHC (DynFlags(maxSimplIterations), ApplicativeArg (xarg_app_arg_many))


myAnd :: [Bool] -> Bool
myAnd []     = True
myAnd (x:xs) = x && myAnd xs

myOr :: [Bool] -> Bool
myOr []     = False
myOr (x:xs) = x || myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny f []     = False
myAny f (x:xs) = f x || (myAny f xs)

myElem :: Eq a => a -> [a] -> Bool
myElem x [] = False
myElem x (y:ys) = if x == y then True else myElem x ys

myReverse :: [a] -> [a]
myReverse x = rev x []
    where
        rev []     a      = []
        rev (y:ys) a      = rev ys  (y:a)

mySquish :: [[a]] -> [a]
mySquish [] = []
mySquish (x:xs) = x ++ mySquish xs

mySquishMap :: (a -> [b]) -> [a] -> [b]
mySquishMap f []  = []
mySquishMap f (x:xs) = f x ++ mySquishMap f xs

squishAgain :: [[a]] -> [a]
squishAgain = mySquishMap id

myMaximumBy :: (a -> a ->  Ordering) -> [a] -> a 
myMaximumBy f []     = error "Exception empty List!!"
myMaximumBy f (x:[]) = x 
myMaximumBy f (x:xs) = case f x mxs of
                        LT -> mxs 
                        GT -> x 
                        EQ -> x
                        where mxs = myMaximumBy f xs

myMinimumBy :: (a -> a ->  Ordering) -> [a] -> a 
myMinimumBy f []     = error "Exception empty List!!"
myMinimumBy f (x:[]) = x 
myMinimumBy f (x:xs) = case f x mxs of
                        LT -> x 
                        GT -> mxs 
                        EQ -> x
                        where mxs = myMinimumBy f xs

myMaximum :: (Ord a) => [a] -> a 
myMaximum  = myMaximumBy compare 

myMinimum :: (Ord a) => [a] -> a 
myMinimum = myMinimumBy compare 