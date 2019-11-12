doTheThing :: Int -> IO ()
doTheThing counter = do
    putStr "Enter a number: "
    input <- getLine
    let number = read input
    let newCounter = counter + number
    putStrLn $ "counter = " ++ (show newCounter)
    doTheThing newCounter


main :: IO()
main = do
  doTheThing 0

