module Chapter_Excersie where


{-
Multiple choice

1. A polymorphic function
a) changes things into sheep when invoked
b) has multiple arguments
c) has a concrete type
d) may resolve to values of different types, depending
on inputs

Answer : C

2. Two functions named f and g have types Char -> String
and String -> [String] respectively. The composed func-
tion g . f has the type
a) Char -> String
b) Char -> [String]
c) [[String]]
d) Char -> String -> [String]

Answer : b

3. A function f has the type Ord a => a -> a -> Bool and we
apply it to one numeric value. What is the type now?

a) Ord a => a -> Bool
b) Num -> Num -> Bool
c) Ord a => a -> a -> Integer
d) (Ord a, Num a) => a -> Bool

Answer : d

4. A function with the type (a -> b) -> c
a) requires values of three different types
b) is a higher-order function
c) must take a tuple as its first argument
d) has its parameters in alphabetical order

Answer : b

5. Given the following definition of f, what is the type of f
True?
f :: a -> a
f x = x
a) f True :: Bool
b) f True :: String
c) f True :: Bool -> Bool
d) f True :: a

Answer : a
-}

tensDigit :: Integral a => a -> a
--First, rewrite it using divMod.
tensDigit x = d
    where 
        d = fst $ x `divMod` 10
         
-- Does the divMod version have the same type as the original version? 
-- Yes

{-
Next, let’s change it so that we’re getting the hundreds
digit instead. You could start it like this (though that
may not be the only possibility):
-}
hundD :: Integral a => a -> a 
hundD x = d
    where
        (xLast , _) = x `divMod` 100
        (_ , d)     = xLast `divMod` 10


foldBool :: a -> a -> Bool -> a 
foldBool x y b = 
    if b 
        then x
        else y

foldBool' :: a -> a -> Bool -> a
foldBool' x y b
    | b = x
    |otherwise = y

{-Fill in the definition. Note that the first argument to our
function is also a function which can be applied to values.
Your second argument is a tuple, which can be used for
pattern matching:-}

g :: (a -> b) -> (a, c) -> (b, c)
g f (a,c) = (f a , c)
