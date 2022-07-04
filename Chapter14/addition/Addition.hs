module Addition where

import Test.Hspec
import Test.QuickCheck

trivialInt :: Gen Int
trivialInt = return 1

oneThrThree :: Gen Int
oneThrThree = elements [1,2,3]

genBool :: Gen Bool
genBool = elements [True, False]

genBool' :: Gen Bool
genBool' = choose (False, True)

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genChar :: Gen Char
genChar = elements ['a'..'z']

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a,b)
genTuple = do
    a <- arbitrary 
    b <- arbitrary
    return (a, b)

genTripple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a,b,c)
genTripple = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
    a <- arbitrary
    b <- arbitrary
    elements [Left a, Right b]

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
    a <- arbitrary 
    elements [Nothing, (Just a)]

genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
    a <- arbitrary
    frequency [(1, return Nothing), (3, return (Just a))]

prop_additionGrater :: Int -> Bool
prop_additionGrater x = x+1 < 0 

runQc :: IO()
runQc = quickCheck prop_additionGrater

main :: IO()
main = hspec $ do
    describe "Addition" $ do 
        it "x+1 is always greater than x" $ do
            property  $ \x -> x+1 > (x :: Int)