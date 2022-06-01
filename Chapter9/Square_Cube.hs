module Square_Cube where

mysqr = [x^2 | x <- [1..5]]

mycube = [x^3 | x <- [1..5]]

mytuble = [(x,y)| x <- mysqr, y <- mycube]

mytuble' = [(x,y)| x <- mysqr, y <- mycube, x < 50, y < 50]

mylen = length [(x,y)| x <- mysqr, y <- mycube, x < 50, y < 50]