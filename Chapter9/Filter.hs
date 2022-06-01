{-1. Given the above, how might we write a filter function that
would give us all the multiples of 3 out of a list from 1-30?-}

ans1 = filter (\x -> rem x 3 == 0) [1..30]

{-
2. Recalling what we learned about function composition,
how could we compose the above function with the length
function to tell us *how many* multiples of 3 there are
between 1 and 30?-}
ans2 = length (ans1)

ans2' = length . filter (\x -> rem x 3 == 0) $ [1..30]

{-Next we’re going to work on removing all articles (’the’, ’a’,
and ’an’) from sentences-}

myfilter :: String -> [String]
myfilter [] = []
myfilter str = filter (\x -> (x /= "a") && (x /= "an")) . words $ str