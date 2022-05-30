module Factorial where

factorial :: Integer -> Integer
-- Base case to terminate recursion
factorial 1 = 1
-- Recursive case to compute the n factorial
factorial n = n * factorial (n-1)


incTimes :: Int -> Int -> Int
incTimes 0 n = n 
incTimes times n = 1 + (incTimes (times -1) n)


applyTimes :: (Eq a, Num a) => a -> (b -> b) -> b -> b
applyTimes 0 f b = b
applyTimes n f b = f (applyTimes (n-1) f b)

incTimes' :: Int -> Int -> Int
incTimes' n x = applyTimes n (+1) x 

f :: Bool -> Maybe Int
f False = Just 0
f _     = Nothing