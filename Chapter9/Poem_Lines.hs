module PoemLine where

firstSen = "Tyger Tyger, burning bright\n"
secondSen = "In the forests of the night\n"
thirdSen = "What immortal hand or eye\n"
fourthSen = "Could frame thy fearful symmetry?"

sentences = firstSen ++ secondSen++ thirdSen ++ fourthSen

shouldEqual = [ "Tyger Tyger, burning bright", 
                "In the forests of the night", 
                "What immortal hand or eye", 
                "Could frame thy fearful symmetry?"]

mylines :: String -> [String]
mylines [] = []
mylines str = if length str == 0 
                        then []
                        else lines : mylines rest
                            where isNewline = flip elem "\n"
                                  trim  = dropWhile isNewline str
                                  lines = takeWhile (not.isNewline) trim
                                  rest  = dropWhile (not.isNewline) trim




main :: IO()
main = print $ "Are they equal?" ++ show (mylines sentences == shouldEqual)