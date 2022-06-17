data FlowerType = Gardenia | Rose | Daisy |Lilac deriving (Show)

type Gardener = String

data Garden = Garden Gardener FlowerType deriving (Show)

-- What is the sum of products normal form of Garden?

{-data Garden' = Garden' Gardener Gardenia'
                | Garden' Gardener Rose'
                | Garden' Gardener Daisy'
                | Garden' Gardener Rose'
                -}