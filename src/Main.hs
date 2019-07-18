module Main where

data Command = Add | Substract
data Error = ParsingError 
type ParsedInput = Either Error Command 

main :: IO ()
main = do
  putStrLn "Enter a command?"
  putStr "Input: "
  input <- getLine 
  let errorOrCommand = parseCommand (input)
  let response = respond (errorOrCommand)
  putStrLn response

parseCommand :: String -> ParsedInput 
parseCommand str = do
  let splitCommand = words str
  parseSplitCommand (head splitCommand) (splitCommand!!1)

parseSplitCommand :: String -> String -> ParsedInput
parseSplitCommand "add" _  = Right Add
parseSplitCommand "substract" _ = Right Substract
parseSplitCommand _ _ = Left ParsingError 

respond :: ParsedInput -> String 
respond (Right (Add)) = "Addition confirmed"
respond (Right (Substract)) = "Substraction confirmed"
respond (Left (ParsingError)) = "Unknown input"

