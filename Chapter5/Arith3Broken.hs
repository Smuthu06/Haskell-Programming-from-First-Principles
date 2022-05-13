module Arith3Broken where


main :: IO ()
Main = do
    print $ 1 + 2           -- missing $
    putStrLn $ 10           -- missing $
    print (negate 1)        -- Change to -1 to 1
    print ((+) 0 blah)
    where blah = negate 1
