module Guard_Duty where

{-
1. It is probably clear to you why you wouldn’t put an otherwise
in your top-most guard, but try it with avgGrade anyway
and see what happens. It’ll be more clear if you rewrite
it as an otherwise match: | otherwise = 'F'. What happens
now if you pass a 90 as an argument? 75? 60?

Answer : F. because otherwise will match all the conditions

2. What happens if you take avgGrade as it is written and
reorder the guards? Does it still typecheck and work the
same? Try moving | y >= 0.7 = 'C' and passing it the
argument 90, which should be an ‘A.’ Does it return an ‘A’?

Answer : C, Because it will match the 1st condition and return that value.

3.pal xs
    | xs == reverse xs = True
    | otherwise = False
a) xs written backwards when it’s True
b) True when xs is a palindrome
c) False when xs is a palindrome
d) False when xs is reversed

Answer : b

4. What types of arguments can pal take?

Answer : Eq a => [a]

5. What is the type of the function pal?

Answer : Pal :: Eq a => [a] -> Bool

6. The following function returns
numbers x
    | x < 0 = -1
    | x == 0 = 0
    | x > 0 = 1
a) the value of its argument plus or minus 1
b) the negation of its argument
c) an indication of whether its argument is a positive or
negative number or zero
d) binary machine language

Answer : c

7. What types of arguments can numbers take?

Answer : (Num a, Ord a) => a

8. What is the type of the function numbers?

Answer : (Num a, Ord a) => a -> a

-}