module BottomMadness where
import Data.Bool
{-
Exercises: Bottom Madness

Will it blow up?
Will the following expressions return a value or be ⊥?

1. [x^y | x <- [1..5], y <- [2, undefined]]
Answer : Yes

2. take 1 $ [x^y | x <- [1..5], y <- [2, undefined]]
Answer :Yes
3. sum [1, undefined, 3]
Answer :Yes
4. length [1, 2, undefined]
Answer : No

5. length $ [1, 2, 3] ++ undefined
Answer : Yes
6. take 1 $ filter even [1, 2, 3, undefined]
Answer : No
7. take 1 $ filter even [1, 3, undefined]
Answer : Yes
8. take 1 $ filter odd [1, 3, undefined]
Answer : No
9. take 2 $ filter odd [1, 3, undefined]
Answer : Yes
10. take 3 $ filter odd [1, 3, undefined]
Answer : No
-}

{-
Intermission: Is it in normal form?

For each expression below, determine whether it’s in:

1. normal form, which implies weak head normal form;
2. weak head normal form only; or,
3. neither.

Remember that an expression cannot be in normal form or
weak head normal form if the outermost part of the expression
isn’t a data constructor. It can’t be in normal form if any part
of the expression is unevaluated.


1. [1, 2, 3, 4, 5]
Answer : 1
2. 1 : 2 : 3 : 4 : _
Answer : 2
3. enumFromTo 1 10
Answer : 3
4. length [1, 2, 3, 4, 5]
Answer : 3
5. sum (enumFromTo 1 10)
Answer : 1
6. ['a'..'m'] ++ ['n'..'z']
Answer : 3
7. (_, 'b')
Answer : 2
-}

{-
Exercises: More Bottoms
As always, we encourage you to try figuring out the answers
before you enter them into your REPL.

1. Will the following expression return a value or be ⊥?
take 1 $ map (+1) [undefined, 2, 3]
Answer : Bottom
2. Will the following expression return a value?
take 1 $ map (+1) [1, undefined, 3]
Answer : Yes
3. Will the following expression return a value?
take 2 $ map (+1) [1, undefined, 3]
Answer : Bottom
4. What does the following mystery function do? What is its
type? Describe it (to yourself or a loved one) in standard
English and then test it out in the REPL to make sure you
were correct.
itIsMystery xs =
map (\x -> elem x "aeiou") xs
Answer : convert the string in to [bool] based on the Vowels("aeiou")
5. What will be the result of the following functions:
a) map (^2) [1..10]
Answer : [1^2,2^2..10^2]
b) map minimum [[1..10], [10..20], [20..30]]
-- n.b. `minimum` is not the same function
-- as the `min` that we used before
Answer [1,10,20]
c) map sum [[1..5], [1..5], [1..5]]
Answer [15,15,15]
-}

sample = map (\x -> bool x (-x) (rem x 3 == 0)) [1..10]