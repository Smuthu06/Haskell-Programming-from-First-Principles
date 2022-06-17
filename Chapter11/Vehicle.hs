module Chapter11.Vehicle where

data Price = Price Integer deriving (Eq, Show)

-- Price is a type constructor
-- Price Integer  Data constructor with  type argument.
-- The value price dosent solely depens on the data constructor it depends on Integer as well.


data Manufactor = Mini | Mazda | Tata deriving (Eq, Show)

-- Manufactor is a Type construcctor
-- Mini, Mazda, Tata is a data constructor, nullary type (takes no arguments)

data Airline = PapuAir | CataPlutsR'Us | TakeYourChancesUnited deriving (Eq, Show)

-- Airline type constructor.
-- PapuAir, CataPlutsR'Us, TakeYourChancesUnited is a data constructor with no arguments.

data Vehicle = Car Manufactor Price | Plane Airline deriving (Eq, Show)

-- Vehicle is a type constructor with no argument.
-- Car type constructor having two type argument Manufactor and Price
-- Plane type constructor having one type argumrnt Airline. 

myCar      = Car Mini (Price 14000)
urCar      = Car Mazda (Price 20000)
clownCar   = Car Tata (Price 7000)
doge       = Plane PapuAir

--1. What is the type of myCar?
-- myCar :: Vehicle

--2. Given the following, define the functions:

isCar :: Vehicle -> Bool
isCar (Car _ _)  = True
isCar (Plane _)  = False

isPlane :: Vehicle -> Bool
isPlane (Plane _) = True
isPlane (Car _ _) = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

-- 3. Now we’re going to write a function to tell us the manufacturer of a piece of data:
getManu :: Vehicle -> Manufactor
getManu (Car x _) = x 

-- If we  use the Pane type with getManu we will get exception.

data Example = MakeExample Int deriving Show 