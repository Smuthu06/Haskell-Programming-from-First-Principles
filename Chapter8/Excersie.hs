module Chapter8.Excersie where
{-
Review of types:

1. What is the type of [[True, False], [True, True], [False,
True]]?
a) Bool
b) mostly True
c) [a]
d) [[Bool]]

Answer :  d

2. Which of the following has the same type as [[True, False],
[True, True], [False, True]]?
a) [(True, False), (True, True), (False, True)]
b) [[3 == 3], [6 > 5], [3 < 4]]
c) [3 == 3, 6 > 5, 3 < 4]
d) ["Bool", "more Bool", "Booly Bool!"]

Answer : a

3. For the following function
func :: [a] -> [a] -> [a]
func x y = x ++ y
which of the following is true?
a) x and y must be of the same type
b) x and y must both be lists
c) if x is a String then y must be a String
d) all of the above

Answer : d

4. For the func code above, which is a valid application of
func to both of its arguments?
a) func "Hello World"
b) func "Hello" "World"
c) func [1, 2, 3] "a, b, c"
d) func ["Hello", "World"]

Answer : b

-}

cattyConny :: String -> String -> String
cattyConny x y = x ++ "mrow" ++ y

flippy = flip cattyConny

appedCatty = cattyConny "woops"

frappe = flippy "haha"

{-
1. What is the value of appedCatty "woohoo!" ? Try to deter-
mine the answer for yourself, then test in the REPL.
Answer : woopsmrowwoohoo
2. frappe "1"
Answer : 1mrowwoops
3. frappe (appedCatty "2")
Answer : woopsmrow2mrowhaha
4. appedCatty (frappe "blue")
Answer : woopsmrowbluemrowhaha
5. cattyConny (frappe "pink")
(cattyConny "green" (appedCatty "blue"))
Answer : greenmrowwoopsmrowblue
6. cattyConny (flippy "Pugs" "are") "awesome"
Answer : aremrowPugsmrowawsome
-}

{-
Write out the steps for reducing dividedBy 15 2 to its final
answer according to the Haskell code.

 15 2 -2 13 (1 times)
 13 2 -2 11 (2 times)
 11 2 -2 9  (3 times)
 9 2  -2 7  (4 times)
 7 2  -2 5  (5 times)
 5 2  -2 3  (6 times)
 3 2  -2 1  (7 times)
(7,1)
-}

{-
Write a function that recursively sums all numbers from
1 to n, n being the argument. So that if n was 5, you’d add
1 + 2 + 3 + 4 + 5 to get 15. The type should be (Eq a, Num a)
=> a -> a.-}

mySum :: (Eq a, Num a) => a -> a
mySum 1 = 1
mySum n = n + mySum (n-1)

{-
Write a function that multiplies two integral numbers
using recursive summation. The type should be (Integral
a) => a -> a -> a
-}

myMul :: (Integral a) => a -> a -> a
myMul 1 y = y 
myMul x y = y + (myMul (x -1) y)