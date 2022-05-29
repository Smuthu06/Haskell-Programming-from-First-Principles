{-
1. Which (two or more) of the following are equivalent?
a) mTh x y z = x * y * z
b) mTh x y = \z -> x * y * z
c) mTh x = \y -> \z -> x * y * z
d) mTh = \x -> \y -> \z -> x * y * z

Answer : a,b,c,d

2. The type of mTh (above) is Num a => a -> a -> a -> a.
Which is the type of mTh 3?
a) Integer -> Integer -> Integer
b) Num a => a -> a -> a -> a
c) Num a => a -> a
d) Num a => a -> a -> a

Answer : d

3. Next, we’ll practice writing anonymous lambda syntax.
For example, one could rewrite:
addOne x = x + 1
Into:
addOne = \x -> x + 1

Try to make it so it can still be loaded as a top-level def-
inition by GHCi. This will make it easier to validate your
answers.


a) Rewrite the f function in the where clause.
addOneIfOdd n = case odd n of
True -> f n
False -> n
where f n = n + 1

(\n -> n+1)

b) Rewrite the following to use anonymous lambda syn-
tax:
addFive x y = (if x > y then y else x) + 5

addFive = (\x -> \y -> if x >y then y else x) +5

c) Rewrite the following so that it doesn’t use anony-
mous lambda syntax:
mflip f = \x -> \y -> f y x

myflip f x y = f y x
-}

{-
Exercises: Variety Pack
1. Given the following declarations
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)

a) What is the type of k?
k :: (a,b) -> b

b) What is the type of k2? Is it the same type as k1 or k3?
k2 :: String

c) Of k1, k2, k3, which will return the number 3 as the
result?
k3


2. Fill in the definition of the following function:
-- Remember: Tuples have the
same syntax for their
-- type constructors and
-- their data constructors.

f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f (a,b,c) (d,e,f) = ((a,d),(c,f))

-}