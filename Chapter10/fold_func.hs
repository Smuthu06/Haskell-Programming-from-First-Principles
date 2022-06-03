


test  = foldr (\a b ->  take 3 a ++ b) [] ["pizza", "apple", "bannana"]


test' = foldl (\b a -> take 3 a ++ b) [] ["pizza", "apple" ,"bannana"]
