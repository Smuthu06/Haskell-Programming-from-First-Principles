module Main where

import Control.Monad  (forever)
import Data.Char      (toLower)
import Data.Maybe     (isJust)
import Data.List      (intersperse)
import System.Exit    (exitSuccess)
import System.Random  (randomRIO)



type WordList = [String]

allWords :: IO WordList
allWords = do
  dict <- readFile "D:/Sankar/Haskell/Haskell Programming/Chapter13/hangman/data/dict.txt"
  return (lines dict)

minWordLength :: Int
minWordLength = 2

maxWordLength :: Int
maxWordLength = 9

gameWords :: IO WordList
gameWords = do
  aw <- allWords
  return (filter gameLength aw)
  where gameLength w = 
         let l = length (w :: String)
         in  (l >= minWordLength) && (l < maxWordLength)

randomWord :: WordList -> IO String
randomWord wl = do
  randomIndex <- randomRIO (0, (length wl)-1)
  return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

-- declare puzzle data type. product of String and Maybe Char and Char. 
-- Word we are trying to guess, char we guessed so far, letter we guessed so far

data Puzzle = Puzzle String [Maybe Char] [Char]

instance Show (Puzzle) where
  show (Puzzle _ discovered guessed) =
    (intersperse ' ' $ fmap renderPuzzleChar discovered ) ++
    "Guessed so far " ++ guessed 

-- Get fresh puzzle 
freshPuzzle :: String -> Puzzle
freshPuzzle w = Puzzle w (map (const Nothing) w) []

-- Get the guessed char in our Puzzle word.
charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle w _ _) c = elem c w

-- find the given word already guessed.
alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ gc) c = elem c gc

-- Get the maybe type char to char
renderPuzzleChar :: Maybe Char -> Char
renderPuzzleChar Nothing = '_'
renderPuzzleChar (Just c)  = c

-- fill the guessed charactoe in correct position
fillInChar :: Puzzle -> Char -> Puzzle
fillInChar (Puzzle word filledSoFar s) c = Puzzle word newFilledSoFar (c:s)
    where
      zipper guessed wordChar guessChar =
        if wordChar == guessed 
          then Just wordChar 
          else guessChar 

      newFilledSoFar = zipWith (zipper c) word filledSoFar


handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your Guess was " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do 
      putStrLn $ "You already guessed that character \n Pick something else"
      return $ puzzle
    (True, _) -> do
      putStrLn "This character is within the word. \n Filling accordingly"
      return $ fillInChar puzzle guess
    (False, _) -> do
      putStrLn "The Character is not in the word. \n Pick something else"
      return $ fillInChar puzzle guess

-- determine the game over scenario based on the guess length.
gameOver :: Puzzle -> IO()
gameOver (Puzzle w filled guess) = 
  if (length guess) > 7 
      then do
        putStrLn "You Loose!"
        putStrLn $ "The word was: " ++ w
        exitSuccess
      else 
        return ()
                                    
-- Find the Game win based on the filled character.
gameWin :: Puzzle -> IO()
gameWin (Puzzle w filled guess) =
  if all isJust filled 
    then
      do 
        putStrLn "You Win !!!"
        exitSuccess
    else
      return ()

-- Run the Game
runGame :: Puzzle -> IO()
runGame puzzle = forever $ do
    gameOver puzzle
    gameWin puzzle
    putStrLn $ "Current Game Status " ++ show puzzle
    putStr "Enter your guess: "
    guess <- getLine
    case guess of 
      [c] -> handleGuess puzzle c >>= runGame
      _   -> putStrLn "Yuor Guess must be a single Character"


main :: IO ()
main = do
  word <- randomWord'
  let puzzle = freshPuzzle (fmap toLower word)
  runGame puzzle