module Database where

import Data.Time
    ( Day(ModifiedJulianDay),
      UTCTime(UTCTime),
      fromGregorian,
      secondsToDiffTime )
import Data.List ( maximumBy )

data DatabaseItem = DbString String 
                  | DBNumber Integer 
                  | DBDate UTCTime
                    deriving (Ord, Show, Eq)

theDatabase :: [DatabaseItem]
theDatabase = [DBDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 23454)),
                DBNumber 9001,
                DbString "Hello",
                DBDate(UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 43123))]

filterDatabase :: [DatabaseItem] -> [UTCTime]
filterDatabase = foldr conDate []
    where conDate (DBDate t) ts = t : ts
          conDate   _        ts = ts

filterDBNumber :: [DatabaseItem] -> [Integer]
filterDBNumber = foldr conNum []
    where
        conNum (DBNumber n) ns = n : ns
        conNum _            ns = ns

mostRecent :: [DatabaseItem] -> UTCTime
mostRecent = foldr maxDate (UTCTime (ModifiedJulianDay 0) 0)
    where
        maxDate (DBDate t) mt = max t mt
        maxDate _          mt = mt

sumDb :: [DatabaseItem] -> Integer
sumDb = foldr sumNum 0
    where 
        sumNum (DBNumber n) acc = n +  acc
        sumNum _            acc = acc

avgDB :: [DatabaseItem] -> Double
avgDB a = fromIntegral (sumDb a) / fromIntegral (length $ filterDBNumber a)