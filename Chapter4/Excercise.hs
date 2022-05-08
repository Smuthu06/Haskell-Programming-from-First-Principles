{-
Exercises: Find the Mistakes
1. not True && true
Answer : Syntax error. true is not a vaild data constructor

2. not (x = 6)
Answer : Syntax error. Comparision have == sign.

3. (1 * 2) > 5
Answer : False
4. [Merry] > [Happy]
Answer : Syntax error. Data constructor not is scope

5. [1, 2, 3] ++ "look at me!"
Answer : Syntax error. Cannot Mach Num and Char
-}

isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = reverse x == x

myAbs :: Integer -> Integer
myAbs x = 
    if x < 0
        then (-1) * x
    else x

f :: (a, b) -> (c, d) -> ((b, d), (a, c))
f x y  = ((snd x, snd y), (fst x, fst y))


{-
Match the function names to their types:

1. Which of the following types is the type of show?
a) show a => a -> String
b) Show a -> a -> String
c) Show a => a -> String
Answer : a

2. Which of the following types is the type of (==)?
a) a -> a -> Bool
b) Eq a => a -> a -> Bool
c) Eq a -> a -> a -> Bool
d) Eq a => A -> Bool
Answer : b

3. Which of the following types is the type of fst?
a) (a, b) -> a
b) b -> a
c) (a, b) -> b
Answer : a

4. Which of the following types is the type of (+)?
a) (+) :: Num a -> a -> a -> Bool
b) (+) :: Num a => a -> a -> Bool
c) (+) :: num a => a -> a -> a
d) (+) :: Num a => a -> a -> a
e) (+) :: a -> a -> a
Answer : d
-}