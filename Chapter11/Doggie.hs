
data Doggie a = Husky a | Mastiff a deriving ( Eq, Show)

data DogueDeBordeaux doge = DogueDeBordeaux doge

-- The behaviour of constructor if it dosent take any value it act as constant.
-- If it takes a value it act like function that donot do expect to getting to applied to it.

-- 1. Is Doggies a type constructor or a data constructor?         - Type Constructor
-- 2. What is the kind of Doggies?                                 - Doggie :: * -> *
-- 3. What is the kind of Doggies String?                          - Doggie String  :: *
-- 4. What is the type of Husky 10?                                - Husky 10 :: Num a => Doggie a
-- 5. What is the type of Husky (10 :: Integer)?                   - Husky (10 :: Integer) :: Doggie Integer
-- 6. What is the type of Mastiff "Scooby Doo"?                    - Mastiff "Scooby Doo" :: Doggie String
-- 7. Is DogueDeBordeaux a type constructor or a data constructor? - Its both because it have same name
-- 8. What is the type of DogueDeBordeaux?                         - DogueDeBordeaux :: doge -> DogueDeBordeaux doge
-- 9. What is the type of DogueDeBordeaux "doggie!"                - DogueDeBordeaux "doggie" -> DogueDeBordeaux String