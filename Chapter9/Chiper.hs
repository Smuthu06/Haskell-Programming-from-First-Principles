module Chiper where

import Data.Char ( ord, chr)


ceaserChiper     :: String -> String 
ceaserChiper str = map chr.map chiper.map ord $ str

chiper :: Int -> Int
chiper = (\x -> if ((x-96)+3) > 26 then (x+3-26) else (x+3))

dichiper :: Int -> Int
dichiper = (\x -> if ((x-3) < 97) then (x-3+26) else (x-3))

ceaserDichiper :: String -> String
ceaserDichiper str = map chr.map dichiper.map ord $ str