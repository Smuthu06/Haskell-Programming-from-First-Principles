module WordToNumberTest where

import WordToNumber
import Test.Hspec



main :: IO()
main = hspec $ do
    describe "Digit to Word" $ do 
    it "returns Zero for 0" $ do 
        digitTOWord 0 `shouldBe` "Zero"
    it "returns One for 1" $ do
        digitTOWord 1 `shouldBe` "One"
