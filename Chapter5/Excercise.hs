{-
Exercises: Type Matching

1. Functions:
a) not
b) length
c) concat
d) head
e) (<)

2. Type signatures:
a) _ :: [a] -> a
b) _ :: [[a]] -> [a]
c) _ :: Bool -> Bool
d) _ :: [a] -> Int
e) _ :: Ord a => a -> a -> Bool

Answer : 
a = c
b = d
c = b
d = a
e = e

-}

{-
Exercises: Type Arguments
Prelude> let f :: a -> a -> a -> a; f = undefined
Prelude> let x :: Char; x = undefined
Prelude> :t f x
1. If the type of f is a -> a -> a -> a, and the type of 𝑥is Char
then the type of f x is
a) Char -> Char -> Char
b) x -> x -> x -> x
c) a -> a -> a
d) a -> a -> a -> Char
Answer : a

2. If the type of g is a -> b -> c -> b, then the type of
g 0 'c' "woot" is
a) String
b) Char -> String
c) Int
d) Char
Answer : b

3. If the type of h is (Num a, Num b) => a -> b -> b, then the
type of
h 1.0 2 is:
a) Double
b) Integer
c) Integral b => b
d) Num b => b
Answer : b

Note that because the type variables  a 𝑎nd 𝑏 are different,
the compiler must assume that the types could be different.

4. If the type of h is (Num a, Num b) => a -> b -> b, then the
type of
h 1 (5.5 :: Double) is
a) Integer
b) Fractional b => b
c) Double
d) Num b => b
Answer : C

5. If the type of jackal is (Ord a, Eq b) => a -> b -> a, then
the type of
jackal "keyboard" "has the word jackal in it"
a) [Char]
b) Eq b => b
c) b -> [Char]
d) b
e) Eq b => b -> [Char]
Answer : a

6. If the type of jackal is (Ord a, Eq b) => a -> b -> a, then
the type of
jackal "keyboard"
a) b
b) Eq b => b
c) [Char]
d) b -> [Char]
e) Eq b => b -> [Char]
Answer : e

7. If the type of kessel is (Ord a, Num b) => a -> b -> a, then
the type of
kessel 1 2 is
a) Integer
b) Int
c) a
d) (Num a, Ord a) => a
e) Ord a => a
f) Num a => a
Answer : e

8. If the type of kessel is (Ord a, Num b) => a -> b -> a, then
the type of
kessel 1 (2 :: Integer) is
a) (Num a, Ord a) => a
b) Int
c) a
d) Num a => a
e) Ord a => a
f) Integer
Answer: e

9. If the type of kessel is (Ord a, Num b) => a -> b -> a, then
the type of
kessel (1 :: Integer) 2 is
a) Num a => a
b) Ord a => a
c) Integer
d) (Num a, Ord a) => a
e) a
Answer: c
-}

{-
Exercises: Apply Yourself
1. -- Type signature of general function
(++) :: [a] -> [a] -> [a]
-- How might that change when we apply
-- it to the following value?
myConcat x = x ++ " yo"
Changed Type Signature : [Char] -> [Char] -> [Char]

2. -- General function
(*) :: Num a => a -> a -> a
-- Applied to a value
myMult x = (x / 3) * 5
Changed Type Signature : Fractional a => a -> a -> a

3. take :: Int -> [a] -> [a]
myTake x = take x "hey you"
Changed Type Signature : Int -> [Char] -> [Char]

4. (>) :: Ord a => a -> a -> Bool
myCom x = x > (length [1..10])
Changed Type Signature : Int -> Int -> Bool

5. (<) :: Ord a => a -> a -> Bool
myAlph x = x < 'z'
Changed Type Signature :Char -> Char -> Bool 

-}

{-
Multiple choice:

1. A value of type [a] is
a) a list of alphabetic characters
b) a list of lists
c) a list whose elements are all of some type 𝑎
d) a list whose elements are all of different types
Answer : c

2. A function of type [[a]] -> [a] could
a) take a list of strings as an argument
b) transform a character into a string
c) transform a string into a list of strings
d) take two arguments
Answer : a

3. A function of type [a] -> Int -> a
a) takes one argument
b) returns one element of type 𝑎 from a list
c) must return an Int value
d) is completely fictional
Answer : b

4. A function of type (a, b) -> a
a) takes a list argument and returns a Char value
b) has zero arguments
c) takes a tuple argument and returns the first value
d) requires that 𝑎 and 𝑏 be of different types
Answer : c
-}
{-
All function applications return a value. Determine the
value returned by these function applications and the type
of that value.

a) (* 9) 6
Num a
b) head [(0,"doge"),(1,"kitteh")]
(Num , String)
c) head [(0 :: Integer ,"doge"),(1,"kitteh")]
(Integer , String)
d) if False then True else False
Bool
e) length [1, 2, 3, 4, 5]
Int
f) (length [1, 2, 3, 4]) > (length "TACOCAT")
Bool

2. Given
x = 5
y = x + 5
w = y * 10
What is the type of w?
Answer : Num a => a

3. Given
x = 5
y = x + 5
z y = y * 10
What is the type of z?
Answer : Num a => a

4. Given
x = 5
y = x + 5
f = 4 / y
What is the type of f?
Answer : Fractional a => a

5. Given
x = "Julie"
y = " <3 "
z = "Haskell"
f = x ++ y ++ z
What is the type of f?
Answer : [Char]

-}

{-
Does it compile?
1. bigNum = (^) 5 $ 10
wahoo = bigNum $ 10
Answer : No. Cannot deduce the arguments
2. x = print
y = print "woohoo!"
z = x "hello world"
Answer : Yes

3. a = (+)
b = 5
c = b 10
d = c 200
Answer : No. Cannot deduce the arguments

4. a = 12 + b
b = 10000 * c
Answer : No. Cannot deduce the arguments
-}

{-
Type variable or specific type constructor?

f :: Num a => a -> b -> Int -> Int
--          [0]   [1]   [2]   [3]
Here, the answer would be: 
constrained polymorphic (Num) ([0]), 
fully polymorphic ([1]), and 
concrete ([2] and [3]).

f :: zed -> Zed -> Blah
    [0]     [1]     [2]
[0] fully polymorphic
[1] Concrete
[2] Concrete

f :: Enum b => a -> b -> C
    [0]       [1]   [2] [3]

[0] Typeclass defnition
[1] fully polymorphic
[2] constrained polymorphic
[3] fully polymorphic

f :: f -> g -> C
    [0] [1]    [2]
[0] fully polymorphic
[1] fully polymorphic
[2] Concrete
-}

{-
Write a type signature:

1.functionH :: [a] -> a
functionH (x:_) = x

2. functionC :: a -> b -> Bool
functionC x y =
if (x > y) then True else False

3. functionS :: (a, b) -> b
functionS (x, y) = y
-}

{-
Given a type, write the function:

1. There is only one function definition that typechecks and
doesn’t go into an infinite loop when you run it.
i :: a -> a
i = undefined
i a = a

2. There is only one version that works.
c :: a -> b -> a
c = undefined
c a _ = a

3. Given alpha equivalence are c'' and c (see above) the same
thing?
c'' :: b -> a -> b
c'' = ?
c'' b _ = b

4. Only one version that works.
c' :: a -> b -> b
c' = undefined
c a b  = b

5. There are multiple possibilities, at least two of which
you’ve seen in previous chapters.
r :: [a] -> [a]
r = undefined
r = tail
r = reverse


6. Only one version that will typecheck.
co :: (b -> c) -> (a -> b) -> a -> c
co = undefined
co btoc atob a c  = btoc $ a atob $ a

7. One version will typecheck.
a :: (a -> c) -> a -> a
a = undefined
a atoc a  = a

8. One version will typecheck.
a' :: (a -> b) -> a -> b
a' = undefined

a'  atob a = b

-}

{-
Type-Kwon-Do
1. 
f :: Int -> String
f = undefined
g :: String -> Char
g = undefined
h :: Int -> Char
h  a = (g .f) a

2. 
data A
data B
data C
q :: A -> B
q = undefined
w :: B -> C
w = undefined
e :: A -> C
e a = (w.q)a

3. 
data X
data Y
data Z
xz :: X -> Z
xz = undefined
yz :: Y -> Z
yz = undefined
xform :: (X, Y) -> (Z, Z)
xform (X, Y) = (xz x ,yz y )

4. 
munge :: (x -> y)
        -> (y -> (w, z))
        -> x
        -> w
munge xtoy ytowz x = fst $ ytowz $ xtoy x

-}