import Control.Monad.State

type GameState = Int
-- type GameValue = (Bool, Int)
-- initialState = (False,0)
initialState = 100

stateExample :: IO ()
stateExample = do
    print $ evalState (setMemory 1) initialState


setMemory :: Int -> State Int GameState
setMemory input = do
    value <- get
    return (value + input)


-- getMemory :: State Int ()
-- getMemory = get
