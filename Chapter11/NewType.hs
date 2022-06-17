{-#LANGUAGE FlexibleInstances#-}



class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats = Goats Int deriving (Show)

instance TooMany Goats where
    tooMany (Goats n) = n > 42

{-Reusing the TooMany typeclass, write an instance of the
typeclass for the type (Int, String). This will require
adding a language pragma named FlexibleInstances5 if
you do not use a newtype — GHC will tell you what to do.-}

instance TooMany (Int, String) where
    tooMany (n, _) = tooMany n

{-Make another TooMany instance for (Int, Int). Sum the
values together under the assumption this is a count of
goats from two fields.-}

instance TooMany (Int, Int) where
    tooMany (n, m) = tooMany (n+m)

{-Make another TooMany instance, this time for (Num a, TooMany
a) => (a, a). This can mean whatever you want, such as
summing the two numbers together.-}

instance (Num a, TooMany a) => TooMany (a,a) where
    tooMany (n,m) = tooMany n && tooMany m



