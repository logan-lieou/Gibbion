module Parser where

import Text.ParserCombinators.ReadP
import Data.Char (isAsciiUpper)

data Token
  = Digit Int
  | Word String
  deriving (Show, Eq, Ord)

-- Types
type Indexed a = (Int, a)

isVowel :: Char -> Bool
isVowel char =
  char `elem` "aeiou"

-- Example Case
vowel :: ReadP Char
vowel =
  satisfy isVowel

atLeastOne :: ReadP Char -> String -> [(String, String)]
atLeastOne parser input =
  case readP_to_S parser input of
    [] -> []
    [(char, remainder)] ->
      case atLeastOne parser remainder of
        [] -> [(char:"", remainder)]
        [(str, finalRemainder)] ->
          [(char:str, finalRemainder)]

atLeastOneVowel :: ReadP [Char]
atLeastOneVowel =
  many1 vowel

airport :: ReadP String
airport = do
  code <- many1 (satisfy isAsciiUpper)
  satisfy (== ' ')
  return code

-- isFor :: String -> Bool
-- forParser :: ReadP Char
