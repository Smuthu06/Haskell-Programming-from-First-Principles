{-# OPTIONS_GHC -Wno-deferred-out-of-scope-variables #-}
import Prelude hiding (($))


-- id :: a -> a
-- a :: *

-- r :: a -> f a
-- a :: *
-- f :: * -> *

notThe :: String -> Maybe String
notThe str = if str /= "the" then Just str else Nothing

--  | replace "the" with "a"
replaceThe :: String -> String
replaceThe =  unwords . go . words 
    where go (x : xs) = case notThe x of 
                        Just x  ->  x  : go xs
                        Nothing -> "a" : go xs

isVowel :: Char -> Bool
isVowel c = c `elem` "aeiou"

{-countTheBeforeVowel :: String -> Int
countTheBeforeVowel =  go 0 . words
    where go i (x:xs:ys)   = case notThe x of
                             Just x  -> go i (xs:ys) 
                             Nothing -> if isVowel  $ xs !! 0 then go (i+1) (ys)  else go i (ys) 
          go i (ys:xs)     = if (i > 0) && (isVowel  ys !! 0) then go (i+1) xs  else go i xs
          go i (ys:[])     = if (i > 0) && (isVowel  ys !! 0) then go (i+1) []  else go i []
          go i []          = 0 + i-}

countVowels :: String -> Integer
countVowels =  fromIntegral . length . filter isVowel

-- | Validate the word.

newtype Word' = Word' String

vowels :: String
vowels     = "aeiou"
conosonant :: String
conosonant = "bcdfgjklmnhrwy"

mkWord :: String -> Maybe String
mkWord str = if (countVowels str) > (countConosonat str) then Nothing else Just str

countConosonat :: String -> Integer
countConosonat = fromIntegral . length .filter isConosonant

isConosonant :: Char -> Bool
isConosonant c = c `elem` conosonant

-- | Its only Natural

data Nat = Zero | Succ Nat deriving (Eq, Show)


-- >>> natToInteger (Succ Zero)
-- 1
natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ (x)) = 1 + natToInteger x

-- >>> integerToNat (-1)

integerToNat :: Integer -> Maybe Nat
integerToNat p = if p < 0 then Nothing else Just (go p)
    where go 0 = Zero
          go p = Succ (go (p-1))

-- | Small library for Maybe

-- >>> isJust (Just 1)
-- True

isJust :: Maybe a -> Bool
isJust x = case x of 
            Just a -> True
            Nothing -> False

isNothing :: Maybe a -> Bool
isNothing  = not . isJust

maybee :: b -> (a -> b) -> Maybe a -> b
maybee b f x = case x of
    Just x ->  f x
    Nothing -> b

fromMaybe :: a -> Maybe a -> a
fromMaybe a x = case x of
    Just i -> i
    Nothing -> a

listtoMaybe :: [a] -> Maybe a
listtoMaybe []     = Nothing
listtoMaybe (x:xs) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing   = []
maybeToList $ Just x  = [x]

catMaybes :: [Maybe a] -> [a]
catMaybes [] = []
catMaybes (x:xs) = maybeToList x ++ catMaybes xs

flipMaybe :: [Maybe a] -> Maybe [a]
flipMaybe [] = Just []
flipMaybe (ma:ms) = case ma of 
                    Just a  -> (a :) <$> (flipMaybe ms)
                    Nothing -> Nothing
     

-- ## Small Library for Either

lefts' :: [Either a b] -> [a]
lefts' = foldr (\x y -> case x of 
                Left a  -> a : y
                Right b -> y)[]

rights' :: [Either a b] -> [b]
rights' = foldr (\x y -> case x of
                Left a -> y
                Right b -> b:y)[]

partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' x = ((lefts' x ), (rights' x))

eitherMaye' :: (b -> c) -> Either a b -> Maybe c
eitherMaye' f x = case x of
                Left _ -> Nothing
                Right y -> Just $ f y

either' :: (a -> c) -> (b -> c) -> Either a b -> c 
either' f g e = case e of
                Left a -> f a
                Right b -> g b 

eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' f = either' (const Nothing) (Just .f)


-- # unfold and iterate

myIterate :: (a -> a) -> a -> [a]
myIterate f x = x : iterate f (f x)

myUnfoldr :: (b -> Maybe (a,b)) -> b -> [a]
myUnfoldr f b = case f b of
                Just (a,b) -> a : myUnfoldr f b
                Nothing -> [] 

betterIterate :: (a -> a) -> a -> [a]
betterIterate f a = myUnfoldr next a
    where next a = Just (a , f a)

-- ## Binary Tree

data Binary_Tree a = Leaf 
                    | Node (Binary_Tree a) a (Binary_Tree a) 
                    deriving (Eq, Show, Ord)

unfold :: (a -> Maybe (a,b,a)) -> a -> Binary_Tree b
unfold f a = case f a of
            Nothing      -> Leaf
            Just (x,y,z) -> Node (unfold f x) y (unfold f z)



