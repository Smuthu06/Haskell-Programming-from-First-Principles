

> data PugType = PugValue

PugType is a type constructor with no arguments. This is type constant.
PugData is a data constructor for type PugType. It has no argument nullary constructor.


> data HuskyType a = HuskyData
HuskyType is a type constructor take single parametrically polymorphic type variable.
HuskyData is a data constructor for HuskyType the type variable argument dose not appear in HuskyData anywhere.
This means our type argument a becomes "phantom" or "has no wittness" .

> data DogueDeBordeaux doge = DogueDeBordeaux doge
DogueDeBordeaux is a type connstructor takes single parametrically polymorphic type variable.
DogueDeBordeaux is a lone data constructor for DogueDeBordeaux type. its take a singele argument like its type constructor.

> myPug = PugValue :: PugType

> myHusky  = HuskyData :: HuskyType a
> myHusky' = HuskyData :: HuskyType Int
no witness to contrary/ phantom arguments

> myDoge :: DogueDeBordeaux String
> myDoge =  DogueDeBordeaux "Hello"
