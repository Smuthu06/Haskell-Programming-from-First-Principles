module Reverse where
rvrs :: String -> String
rvrs x = drop 9 x ++ take 4 (drop 5 x) ++ take 5 x   -- Curry is awesome

main :: IO ()
main = print (rvrs "Curry is awesome")
