import Control.Monad.State

type StateValue = Int
initialState = 0

stateExample :: IO ()
stateExample = do
    putStrLn "before"
    putStrLn $ show $ evalState getMemory

    -- setMemory 3

    putStrLn "after"
    putStrLn $ show getMemory


-- setMemory :: Int -> State Int ()
-- setMemory input = runState $ initialState put input

getMemory :: State Int ()
getMemory = get
