 
 fibs = 1:scanl (+) 1 fibs
 fibN n = fibs !! n 

 fibs' = take 20 fibs

 fibs'' = takeWhile (<100) fibs

 fact = scanl (*) 1 [1..]

 factorial n = fact !! n 

 