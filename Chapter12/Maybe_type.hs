

-- |Use maybe type for undenined/ not possible outputs.
ifevenAdd2 :: Integer -> Maybe Integer
ifevenAdd2 x = if even x then Just (x+2) else Nothing

-- ## Smart Constructor ##

type Name = String

type Age  = Int

-- | declaring the person data type
data Person = Person Name Age deriving Show

-- | mkPerson is what we call a smart constructor.
-- | It allows us to construct values of a type only when they meet certain criteria, 
-- | so that we know we have a valid value, and return an explicit signal when we do not.
mkPerson :: Person -> Maybe Person
mkPerson (Person name age) =  if (name /= " ") && (age > 0) then Just $ Person name age else Nothing

-- | data Either a b = Left a | Right b

data PersonInvaild = NameEmpty | AgetooLow 

-- | Convert Person Invaild into string
toString :: PersonInvaild -> String
toString NameEmpty = "Name Empty"
toString AgetooLow = "Age too low"

instance Show PersonInvaild where
    show = toString

-- | smart constructor with Either type.
mkPerson' :: Name -> Age -> Either PersonInvaild Person
mkPerson' name age 
    | name /= " " && age > 0 = Right $ Person name age
    | name == " "            = Left NameEmpty
    | otherwise              = Left AgetooLow

type ValidatePerson a = Either [PersonInvaild] a

nameOkay :: Name -> Either [PersonInvaild] Name
nameOkay name = case name /=  " " of
    True  -> Right name
    False -> Left [NameEmpty]

ageOkay :: Age -> Either [PersonInvaild] Age
ageOkay age = case age > 0 of
    True  -> Right age
    False -> Left [AgetooLow]

mkPerson'' :: Name -> Age -> ValidatePerson Person
mkPerson'' name age = mkPro (nameOkay name) (ageOkay age)

mkPro :: ValidatePerson Name -> ValidatePerson Age -> ValidatePerson Person
mkPro (Right nameOkay) (Right ageOkay) = Right (Person nameOkay ageOkay)
mkPro (Left badName)   (Left badAge)   = Left  (badName ++ badAge)
mkPro (Left badName)   _               = Left  (badName)
mkPro _                (Left badAge)   = Left  (badAge)

id' :: a -> a
id' a = a