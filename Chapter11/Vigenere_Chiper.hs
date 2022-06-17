{-# LANGUAGE DataKinds #-}
module Vigenere_Chiper where

import Data.Char ( ord, chr, toUpper)

vigenere :: String -> String -> String
vigenere key plain = chiper $ keyPair  key plain

-- Define the key pair for the vigenere chiper
keyPair :: String -> String -> [(Char,Int)]
keyPair key plain =  zip plain $ map (\x -> x-65) $ map ord $ take (len plain) . concat  
                     . replicate (mod (len plain) (length key)) $ key
    where len = length . filter (\x-> x /= ' ')

-- convert keypair to encoded text
chiper :: [(Char, Int)] -> String
chiper = map (\(x, y) -> chr $ (if code x y > 90 then mod (code x y) 90 else (code x y)) )
    where code x y =  ((ord x)+y)