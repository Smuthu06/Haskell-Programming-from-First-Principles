import Test.Hspec


type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid =
                    NameEmpty
                    | AgeTooLow
                    | PersonInvalidUnknown String
                    deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
        | name /= "" && age > 0 = Right $ Person name age
        | name == "" = Left NameEmpty
        | not (age > 0) = Left AgeTooLow
        | otherwise = Left $ PersonInvalidUnknown $
                        "Name was: " ++ show name ++
                        " Age was: " ++ show age

gimmePerson :: IO()
gimmePerson = do
    putStr "Enter Person Name: "
    name <- getLine
    putStr "Enter Person Age: "
    a <- getLine
    let age = read a :: Integer
    let person = mkPerson name age
    putStrLn  $ show person
