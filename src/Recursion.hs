doTheThing :: Int -> IO ()
doTheThing counter = do
    putStr "Enter a number: "
    input <- getLine
    let number = read input
    let newCounter = increment number counter
    putStrLn $ "counter = " ++ (show newCounter)
    doTheThing newCounter


type App = 

increment :: Int -> Int -> Int
increment input counter = input + counter

main :: IO()
main = do
  doTheThing 0

