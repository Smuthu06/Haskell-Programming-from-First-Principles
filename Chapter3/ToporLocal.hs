module ToporLocal where

topLevelfunction :: Int -> Int
topLevelfunction x = x + woot + topLevelValue
    where woot = 10

topLevelValue :: Int
topLevelValue =  5