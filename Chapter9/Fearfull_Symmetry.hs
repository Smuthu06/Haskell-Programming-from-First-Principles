module Chapter9.Fearfull_Symmetry where



myWords :: String -> [String]
myWords [] = []
myWords str = 
    if (length str == 0) 
        then [] 
        else word : myWords rest
        where 
            isSpace = flip elem " "
            trim    = dropWhile isSpace str
            word    = takeWhile (not.isSpace) trim
            rest    = dropWhile (not.isSpace) trim