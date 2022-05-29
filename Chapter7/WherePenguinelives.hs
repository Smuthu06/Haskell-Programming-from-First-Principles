module WherePenguinelives where

data WherePenguinsLive =  
    Galapagos 
    | Antarctica 
    | Australia 
    | SouthAfrica 
    | SouthAmerica 
    deriving (Eq, Show)

data Penguin = Peng WherePenguinsLive
    deriving (Eq, Show)

isSouthafrica :: WherePenguinsLive -> Bool
isSouthafrica SouthAfrica = True
isSouthafrica _           = False

giveMeWhereTheyLive :: Penguin -> WherePenguinsLive
giveMeWhereTheyLive (Peng whereitlives) = whereitlives

humboldt = Peng SouthAmerica
gentoo = Peng Antarctica
macaroni = Peng Antarctica
little = Peng Australia
galapagos = Peng Galapagos

isGalapagos :: Penguin -> Bool
isGalapagos (Peng Galapagos) = True
isGalapagos _                = False

isHumboldt :: Penguin -> Bool
isHumboldt (Peng SouthAmerica) = True
isHumboldt _                   = False

galapagosorhumboldt :: Penguin -> Bool
galapagosorhumboldt x =  (isGalapagos x) || (isHumboldt x)

