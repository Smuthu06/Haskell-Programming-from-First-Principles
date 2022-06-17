
data GuessWhat = ChickenButt deriving (Eq, Show)

data Id a = MkId a deriving (Eq, Show)

data Product a b = Product a b deriving (Eq, Show)

data Sum a b = First a | Second b deriving (Eq, Show)

data RecordProduct a b = RecordProduct {
                            pfirst  :: a,
                            psecond :: b
                        } deriving (Eq, Show)

newtype NumCow = NumCow Int deriving (Eq, Show)

newtype NumPig = NumPig Int deriving (Eq, Show)

data Farmhouse = Farmhouse NumCow NumPig deriving (Eq, Show)

type Farmhouse' = Product NumCow NumPig

-- Framhouse Framhouse' are same.

newtype NumSheep = NumSheep Int deriving (Eq, Show)

data BigFarmhouse = BigFarmhouse NumCow NumSheep NumPig deriving (Eq, Show)

-- Nesting the Product
type BigFarmhouse' = Product NumCow (Product NumSheep NumPig)

type Name = String

type Age = Int

type LoveMud = Bool

type PoundsofWool = Int

data CowInfo = CowInfo Name Age deriving (Eq, Show)

data PigInfo = PigInfo Name Age LoveMud deriving (Eq, Show)

data SheepInfo = SheepInfo Name Age PoundsofWool deriving (Eq, Show)

data Animal = Cow CowInfo | Pig PigInfo | Sheep SheepInfo deriving (Eq, Show)

-- Alternatively 

--data Animal' = Sum CowInfo (Sum PigInfo SheepInfo)

idInt :: Id Integer
idInt = MkId 10

type Awsome = Bool
type Name'   = String

person :: Product Name' Awsome
person = Product "Simon" True

data Twitter = Twitter deriving (Show)

data AskFm = AskFm deriving (Show)

-- Without using product type we cannot have both values at same time. Either We can First or Second, because sum are means expressing disjunction.
socialNetwork :: Sum Twitter AskFm
socialNetwork = First Twitter

type SN = Sum Twitter AskFm

-- | Record datatype without using record syntax
myRecord :: RecordProduct Integer Float
myRecord = RecordProduct 3 0.001

-- | Record datatype with record syntax.
myRecord' :: RecordProduct Integer Float
myRecord' = RecordProduct { pfirst  = 42
                          , psecond = 0.003} 

data OperatingSystem  =  GnuPlusLinux 
                       | OpenBSD 
                       | Mac 
                       | Windows 
                       deriving (Eq, Show, Enum)

data ProgLang =   Haskell
                | Agda 
                | Idris 
                | Purescript
                deriving (Eq, Show, Enum)

data Programmer = Programmer {
                                 os   :: OperatingSystem 
                               , lang :: ProgLang } deriving (Eq, Show)

-- | Construct data from programmer datatype
ninetoFive :: Programmer
ninetoFive = Programmer {os = Mac, lang = Haskell}

feelingWixardly :: Programmer
feelingWixardly = Programmer {os = GnuPlusLinux, lang = Agda}


-- | Get all operating System
allOperatingSystem :: [OperatingSystem]
allOperatingSystem = enumFromTo GnuPlusLinux Windows

-- | Get all programming language
allProgLang :: [ProgLang]
allProgLang = [Haskell, Agda, Idris, Purescript]

-- | Get all programmers configurations
allProgrammers :: [Programmer]
allProgrammers =  [Programmer os  lang  | os <- allOperatingSystem, lang <- allProgLang]

-- | Percolate values
data ThereYet = There Float Int Bool deriving (Eq, Show)

-- | Builder pattern
notYet :: Int -> Bool -> ThereYet
notYet = nope 20.3

notQuite :: Bool -> ThereYet
notQuite = notYet 10

yuss :: ThereYet
yuss = notQuite True

-- ## Destructing Values ##

newtype Acres = Acres Int deriving (Eq, Show)

-- | Declaring farmer type sumtype
data FarmerTye = DairyFarmer
             |WheatFarmer
             |SoyabeanFarmer
             deriving (Eq,Show)

-- | Farmer is a product of Name Acres and FramerType
data Farmer = Farmer Name Acres FarmerTye deriving (Eq, Show)

isDairyFrammer :: Farmer -> Bool
isDairyFrammer (Farmer _ _ DairyFarmer) = True
isDairyFrammer _                        = False

-- | Using Record syntax
data FarmerRec = Farmer' { name :: Name
                         , acres :: Acres
                         , framertype :: FarmerTye} deriving (Eq, Show)

isDairyFrammer' :: FarmerRec -> Bool
isDairyFrammer' framer = case framertype framer of
                         DairyFarmer -> True
                         _           -> False

-- ## Function type is expoential

-- | Either have Number of data constructor + Number of data constructor
-- | Product representation Number of data constructor * Number of data constructor
-- | Function Type Number of data constructor ^ Number of data constructor

-- ## The Quad

data Quad =   One
            | Two 
            | Three 
            | Four 
            deriving (Eq, Show)

-- | how many different forms can this take? - 4+4
-- | Product quad 4 * 4
-- | func Quad 4^4
-- | prodtBool :: (Bool, Bool, Bool) - 2 ^3
-- | gTwo :: Bool -> Bool -> Bool - 2 ^ (2*2)
-- | fTwo :: Bool -> Quad -> Quad - 2 ^ (4*4)



