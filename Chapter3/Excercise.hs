{--
#Excercise : Scope

1. These lines of code are from a REPL session. Is 𝑦 in scope
for 𝑧?
Prelude> let x = 5
Prelude> let y = 7
Prelude> let z = x * y

Answer : Yes

2. These lines of code are from a REPL session. Is ℎ in scope
for 𝑔? Go with your gut here.
Prelude> let f = 3
Prelude> let g = 6 * f + h

Answer : No

3. This code sample is from a source file. Is everything we
need to execute area in scope?
area d = pi * (r * r)
r = d / 2

Answer : Yes

4. This code is also from a source file. Now are 𝑟 and 𝑑 in
scope for area?
area d = pi * (r * r)
where r = d / 2

Answer : No
--
}

{--
#Excercise : Systex Error

1. ++ [1, 2, 3] [4, 5, 6]
Syntax error : Infix operator should use parenthis 

2. '<3' ++ ' Haskell'
Syntax error : Strings should represent in a `"` 

3. concat ["<3", " Haskell"]
No Syntax error : Output -> "<3Haskell"
--}

{--
a) concat [[1, 2, 3], [4, 5, 6]]
Ans : [1,2,3,4,5,6]

b) ++ [1, 2, 3] [4, 5, 6]
Ans : Syntax error. Parentheis should used for infix operator during prefix call

c) (++) "hello" " world"
Ans : "hello world"

d) ["hello" ++ " world]
Ans : Syntax error. Cannot use operator inside the list

e) 4 !! "hello"
Ans : Syntax error. (!!) :: [a] -> Int -> a

f ) (!!) "hello" 4
Ans : o
g) take "4 lovely"
Ans : "love"

h) take 3 "awesome"
Ans : "awe"
--}

{--
Expersions:
a) concat [[1 * 6], [2 * 6], [3 * 6]]
b) "rain" ++ drop 2 "elbow"
c) 10 * head [1, 2, 3]
d) (take 3 "Julie") ++ (tail "yes")
e) concat [tail [1, 2, 3],
           tail [4, 5, 6],
           tail [7, 8, 9]]

Results:
a) "Jules"
b) [2,3,5,6,8,9]
c) "rainbow"
d) [6,12,18]
e) 10

Match:
a = d
b = c
c = e
d = a
e = b
--}