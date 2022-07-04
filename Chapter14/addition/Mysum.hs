module MySum where

import Test.Hspec

mySum :: (Eq a, Num a) => a -> a 
mySum 1 = 1
mySum n = n + mySum (n-1)

main :: IO()
main = hspec $ do
    describe "My Sum" $ do
        it "mySum 2 is greaterthan 3" $ do
            (mySum 2 ) `shouldBe` 3