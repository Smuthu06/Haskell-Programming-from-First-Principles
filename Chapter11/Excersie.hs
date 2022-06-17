import Data.Char (toUpper, isUpper, toLower)
import Data.List ( intercalate, elemIndex,sort, group, sortOn )


 {-
 ## Multiple choice ##
1. Given the following datatype:
data Weekday =
Monday
| Tuesday
| Wednesday
| Thursday
| Friday
we can say:
a) Weekday is a type with five data constructors
b) Weekday is a tree with five branches
c) Weekday is a product type
d) Weekday takes five arguments
Answer : a
2. and with the same datatype definition in mind, what is
the type of the following function, f?
f Friday = "Miller Time"
a) f :: [Char]
b) f :: String -> String
c) f :: Weekday -> String
d) f :: Day -> Beer
Answer  : c
3. Types defined with the data keyword
a) must have at least one argument
b) must begin with a capital letter
c) must be polymorphic
d) cannot be imported from modules
Answer : b
4. The function g xs = xs !! (length xs - 1)
a) is recursive and may not terminate
b) delivers the head of xs
c) delivers the final element of xs
d) has the same type as xs
Anwer : d
-}

-- ## As Patterm ##

f :: Show a => (a,b) -> IO (a,b)
f t@(a, _) = do
    print a
    return t

doubleUp :: [a] -> [a]
doubleUp xs@(x:_) = x : xs

isSubsequence :: Eq a => [a] ->[a] -> Bool
isSubsequence [] _ = True
isSubsequence _ [] = False
isSubsequence aas@(a:as) (b:bs) = 
    if a == b
        then isSubsequence as bs
        else isSubsequence aas bs

captaliseWord :: String -> [(String, String)]
captaliseWord s = map capsl  $ words s
    where capsl aas@(c:cs) = (aas , toUpper c :cs)

-- | Captalis the starting of the word.
captalise :: String -> String
captalise []     = []
captalise (x:xs) = toUpper  x : xs

-- | Captalise pharagraph split by '.'
captaliseParagrap :: String -> String
captaliseParagrap str = intercalate "." $ map captalise $ splitBy (\x-> x == '.') str

-- | Split list by groups of one or more sep.
splitBy :: (a -> Bool) -> [a] -> [[a]]
splitBy _ [] = []
splitBy isSep lst =
  let (first, rest) = break isSep lst
  in  first:splitBy isSep (dropWhile isSep rest)

-- | Create data structure to capture the phone keypad structure.

-- | Valid digits 1234567890*#
type Digit = Char
-- | Vaild press 1 and goes up
type Presses = Int
-- | Button is a product type contains digit and it associate characters
data Button = Button Digit [Char]

-- | Phone Keypad structure
data DaPhone = DaPhone [Button]

phone :: DaPhone
phone = DaPhone [one, two, three, four, five, six, seven, eight, nine, star, zero, hash]
   where
        one = Button '1' "1"
        two = Button '2' "abc2"
        three = Button '3' "def3"
        four = Button '4' "ghi4"
        five = Button '5' "jkl5"
        six = Button '6' "mno6"
        seven = Button '7' "pqrs7"
        eight = Button '8' "tuv8"
        nine = Button '9' "wxyz9"
        star = Button '*' "^"
        zero = Button '0' "+ 0"
        hash = Button '#' ".,#"


convo :: [String]
convo =
    ["Wanna play 20 questions",
    "Ya",
    "U 1st haha",
    "Lol ok. Have u ever tasted alcohol",
    "Lol ya",
    "Wow ur cool haha. Ur turn",
    "Ok. Do u think I am pretty Lol",
    "Lol ya",
    "Just making sure rofl ur turn"]

-- assuming the default phone definition
-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]

reverseTap :: DaPhone -> Char -> [(Digit, Presses)]
reverseTap ph s 
    | isUpper s  = ('*',1) : tapChar (toLower s) ph
    | otherwise = tapChar s ph
    where tapChar s (DaPhone buttons) = filter (\(x,y) -> y /= (-1) )$ map (\x -> case (elemIndex s $ phChar x) of
                                         (Just i)  ->  ((digit x ) , i+1)
                                         Nothing   ->  (' ', (-1))) buttons
          phChar (Button _ chars) = chars
          digit  (Button d _)     = d

-- | Convert string into Tap combination.
cellphoneDead :: DaPhone -> String -> [(Digit, Presses)]
cellphoneDead _ []      = []
cellphoneDead ph (c:cs) = reverseTap ph c ++ cellphoneDead ph cs

-- | Calculate number of taps need to complete the text.
fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . map snd

-- | most popular element in list
mostPopular :: Ord a => [a] -> a
mostPopular = head.head.reverse. sortOn length . group .sort

-- | Find most popular letter in a given string.
mostPopularletter :: String -> Char
mostPopularletter = mostPopular

-- | Cost of the finger taps
cost :: Char -> Presses
cost = fingerTaps . reverseTap phone

-- | Coolest letter
coolestletter :: [String] -> Char
coolestletter = mostPopularletter . filter (\x -> x /= ' ') . concat

-- | coolest word
coolestWord :: [String] -> String
coolestWord = mostPopular. foldMap words

-- # Hutton's Razer #

-- | decleare expersion data type.
data Expr = Lit Integer | Add Expr Expr 

-- |  define “eval” function which reduces an expression to a final sum.
eval :: Expr -> Integer
eval (Lit x)        = x
eval (Add a b)      = eval a + eval b

-- |Define printer experssion for Exp
printExpr :: Expr -> String
printExpr  (Lit i)  = show i 
printExpr (Add x y) = printExpr x ++ "+" ++ printExpr y

