import Control.Monad.Trans.State

doTheThing :: StateT Int IO ()
doTheThing = do
    putStr "Enter a number: "
    input <- getLine
    let number = read input
    counter <- get
    let newCounter = counter + number
    putStrLn $ "counter = " ++ (show newCounter)
    put newCounter
    doTheThing 


main :: IO()
main = do
  doTheThing 0

