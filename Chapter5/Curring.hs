module Currying where

nonsense :: Bool -> Integer
nonsense True = 805
nonsense False = 31337

curriedFunction :: Integer
                -> Bool
                -> Integer
curriedFunction i b = i + (nonsense b)

uncurryFunction :: (Integer,Bool) -> Integer
uncurryFunction (i,b) = i + (nonsense b)

anonymus :: Integer -> Bool -> Integer
anonymus  = \i b -> i + (nonsense b)

anonNest :: Integer -> Bool -> Integer
anonNest = \i -> \b -> i +(nonsense b)