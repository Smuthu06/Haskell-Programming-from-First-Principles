module Chapter7.Guards where

myAbs :: (Num a, Ord a) => a -> a
--my absolute function
myAbs x 
    | x < 0 = (-x)
    |otherwise = x

bloodNa :: Integer -> String
-- Check blood Na level
bloodNa x
    | x < 135   = "to low"
    | x > 145   = "to high"
    | otherwise = "Just right"

isRight :: (Num a, Eq a) => a -> a -> a -> String
-- Check the given triangle is right angle triangle
isRight a b c 
    | a^2 + b^2 == c^2 = "Its is right"
    |otherwise = "Not right"

dogYr :: Integer -> Integer
-- Convert human age to dog age
dogYr x 
    | x <= 0   = x*0
    | x <= 1   = x*15
    | x <= 2   = x*12
    | x <= 4   = x*8
    |otherwise = x*6


avgGrade :: (Fractional  a , Ord a) => a -> String
--Get the score and produce the average score.
avgGrade x
    | y > 0.9   = "A"
    | y > 0.8   = "B"
    | y > 0.7   = "C"
    | y >= 0.59 = "D"
    | y < 0.59  = "F"
    where y = x/100

