

{-1. Given the following sets of consonants and vowels:-}

stops :: String
stops  = "pbtdkg"
vowels :: String
vowels = "aeiou"

{-a) Write a function that takes inputs from stops and vowels and makes 3-tuples of all possible stop-vowelstop combinations. 
These will not all correspond to real words in English, although the stop-vowel-stop pattern is common enough that many of them will.-}


svs = [[s1, v, s2] | s1 <- stops, v <- vowels, s2 <- stops]

{-b) Modify that function so that it only returns the combinations that begin with a p.-}

svs' = [[s1, v, s2] | s1 <- stops, v <- vowels, s2 <- stops, (s1 == 'a' ||s1 == 'p')]

{-c) Now set up lists of nouns and verbs (instead of stops
and vowels) and modify the function to make tuples
representing possible noun-verb-noun sentences.-}

nouns = ["dog", "cat", "bird", "tomato", "peach"]
verbs = ["eat", "drink", "kill"]

sentence = [[n1 ++ " " ++ v ++ " "++ n2]| n1 <- nouns, v <- verbs, n2 <- nouns]

seekritFunc   :: String -> Int
seekritFunc x =  div (sum (map length (words x))) (length (words x))

seekritFunc'   :: String -> Double
seekritFunc' x =  fromIntegral (sum (map length (words x))) / fromIntegral (length (words x))

myAnd :: [Bool] -> Bool
myAnd = foldr (&&) True

myOr :: [Bool] -> Bool
myOr = foldr (||) False

myAny :: (a -> Bool) -> [a] -> Bool
myAny f = foldr  (||) False . map f

myElem :: Eq a => a -> [a] -> Bool
myElem y = foldr (||) False . map (\x -> x == y)
--myElem y = foldr (\x b -> b || x == y ) False

myReverse :: [a] ->[a]
myReverse = foldl (flip (:)) []

myMap :: (a -> b) -> [a] -> [b]
myMap f = foldr (\ x acc -> f x : acc) []

myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f = foldr (\x acc -> if f x then (x : acc) else acc) []

squish :: [[a]] -> [a]
squish = foldr (++) []

squishMap :: (a -> [b]) -> [a] -> [b]
squishMap f = foldr (\x acc -> f x ++ acc) []

squishAgain :: [[a]] -> [a]
squishAgain = squishMap id

maximumBy :: (a -> a -> Ordering) -> [a] -> a
maximumBy f = head.foldr (\a acc -> case acc of
                                        []     -> [a]
                                        (b:bs) -> if f a b == GT then [a]else [b]) []

minimumBy :: (a -> a -> Ordering) -> [a] -> a
minimumBy f = head.foldr (\a acc -> case acc of
                                        []     -> [a]
                                        (b:bs) -> if f a b == LT then [a]else [b]) []