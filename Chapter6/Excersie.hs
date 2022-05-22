{-LNAGUAGE -}

module Excersice where

{-
Exercises: Will They Work?

1. max (length [1, 2, 3]) (length [8, 9, 10, 11, 12])
Answer : Yes
2. compare (3 * 4) (3 * 5)
Answer : Yes
3. compare "Julie" True
Answer : No Type mismatch error
4. (5 + 3) > (3 + 6)
Answer : Yes

-}

{-
Multiple choice
1. The Eq class

a) includes all types in Haskell
b) is the same as the Ord class
c) makes equality tests possible
d) only includes numeric types

Answer : c

2. The typeclass Ord

a) allows any two values to be compared
b) is a subclass of Eq
c) is a superclass of Eq
d) has no instance for Bool

Answer : a b

3. Suppose the typeclass Ord has an operator >. What is the
type of >?

a) Ord a => a -> a -> Bool
b) Ord a => Int -> Bool
c) Ord a => a -> Char
d) Ord a => Char -> [Char]

Answer : a

4. In x = divMod 16 12

a) the type of 𝑥is Integer
b) the value of 𝑥is undecidable
c) the type of 𝑥is a tuple
d) 𝑥is equal to 12 / 16

Answer: c

5. The typeclass Integral includes
a) Int and Integer numbers
b) integral, real, and fractional numbers
c) Schrodinger’s cat
d) only positive numbers

Answer : a
-}

{-
Does it typecheck?

1. Does the following code typecheck? If not, why not?

data Person = Person Bool
printPerson :: Person -> IO ()

printPerson person = putStrLn (show person)

Answer : No . Add deriving from Show for person data declearation.

2. Does the following typecheck? If not, why not?
data Mood = Blah | Woot deriving Show
settleDown x = if x == Woot
                  then Blah
                else x

Answer : Yes . Show derived for type declearation

3. If you were able to get settleDown to typecheck:
a) What values are acceptable inputs to that function?
b) What will happen if you try to run settleDown 9? Why?
c) What will happen if you try to run Blah > Woot? Why?

Answer 
a. Blah or Woot from Mood datatype
b. Type mismatch error
c. Type checking error. Ord not derivied from Mood data

4. Does the following typecheck? If not, why not?

type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object
deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"

Answer : s1 will throw error ; s2 no error.

-}
{-
Given a datatype declaration, what can we do?

data Rocks =
Rocks String deriving (Eq, Show)

data Yeah =
Yeah Bool deriving (Eq, Show)

data Papu =
Papu Rocks Yeah
deriving (Eq, Show)

Which of the following will typecheck? For the ones that
don’t typecheck, why don’t they?

1. phew = Papu "chases" True

Type check error. phew = Papu (Rocks "Chases") ("Yeah True")

2. truth = Papu (Rocks "chomskydoz") (Yeah True)

No type check error.



3. equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

No error

4. comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'

Error. Ord class not derivied . add for all three data type.

-}

{-
Match the types
1. For the following definition.
a) i :: Num a => a
i = 1
b) Try replacing the type signature with the following:

i :: a
Won't work . we cannot drop the typeclass constraint.

2. a) f :: Float
f = 1.0

b) f :: Num a => a
Wont work. a must be Fractional decleartion

3. a) f :: Float
f = 1.0

b) f :: Fractional a => a
Will work

4. Hint for the following: type :info RealFrac in your REPL.
a) f :: Float
f = 1.0

b) f :: RealFrac a => a
Will work

5. a) freud :: a -> a
freud x = x
will work 

b) freud :: Ord a => a -> a
works but make more specific.

6. a) freud' :: a -> a
freud' x = x
work

b) freud' :: Int -> Int
will work, but make more specific

7. a) myX = 1 :: Int
sigmund :: Int -> Int
sigmund x = myX
work

b) sigmund :: a -> a
Wont work 'a' need to be in Num typeclass

8. a) myX = 1 :: Int
sigmund' :: Int -> Int
sigmund' x = myX
works

b) sigmund' :: Num a => a -> a
works
9. a) You’ll need to import sort from Data.List.

jung :: Ord a => [a] -> a
jung xs = head (sort xs)

b) jung :: [Int] -> Int

works. but limited for specific type.

10. a) young :: [Char] -> Char
young xs = head (sort xs)

b) young :: Ord a => [a] -> a
works. Make more general function.

1. a) mySort :: [Char] -> [Char]
mySort = sort
signifier :: [Char] -> Char
signifier xs = head (mySort xs)

b) signifier :: Ord a => [a] -> a
wont work. mysort require [Char]
-}

{-
Type-Kwon-Do Two: Electric Typealoo

1. chk :: Eq b => (a -> b) -> a -> b -> Bool
chk = ???
chk f a b = f a == b

2.arith :: Num b
=> (a -> b)
-> Integer
-> a
-> b
arith = ???

arith f i a = f fromIntegral i + a

-}