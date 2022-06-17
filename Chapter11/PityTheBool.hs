import Data.Int

data BigSmall = Big Bool | Small Bool deriving (Eq, Show) 

-- | What is the cardinality of this datatype?
-- 2+2 = 4

data NumberOrBool = Numba Int8 | BoolyBool Bool deriving (Eq, Show) 

myNumba = Numba (-128)