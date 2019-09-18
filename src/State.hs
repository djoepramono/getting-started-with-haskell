import Control.Monad.State

type StateValue = Int
initialState = (0)

stateExample :: IO()
stateExample = do
    putStrLn "before"
    putStrLn getMemory

    setMemory 3

    putStrLn "after"
    putStrLn getMemory


setMemory :: Int -> State Int ()
setMemory input = runState $ initialState put input

getMemory :: String
getMemory = evalState get $ show initialState
