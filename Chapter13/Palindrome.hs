module Plaindrome where

import Control.Monad ( forever )
import System.Exit   (exitSuccess)
import Data.Char     (toLower)

main :: IO()
main = forever $ do
    l <- getLine
    let line = concat.words $ fmap toLower l
    if (line == (reverse line))
        then putStrLn "It is Palindrome!"
        else
            do
            putStrLn "Not a Palindrome"
            exitSuccess
            

