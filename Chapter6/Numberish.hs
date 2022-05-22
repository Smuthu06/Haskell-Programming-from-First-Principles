module Numberish where

--Typeclass declaration for Numberish
class Numberish a where
    fromNumber :: Integer -> a
    toNumber   :: a       -> Integer

data Age = Age Integer deriving (Eq, Show)

instance Numberish Age where
    fromNumber n     = Age n
    toNumber (Age n) = n

data Year = Year Integer deriving (Eq, Show)

instance Numberish Year where
    fromNumber n      = Year n
    toNumber (Year n) = n


sumNumberish :: Numberish a => a -> a -> a
sumNumberish a b = fromNumber summed
    where integerOfA = toNumber a 
          integerOfB = toNumber b 
          summed = integerOfA + integerOfB