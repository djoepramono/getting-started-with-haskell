import Control.Monad.State

type GameState = Int
initialState = 100

stateExample :: IO ()
stateExample = do
    print $ evalState (play [1,2,0,5]) initialState


play :: [Int] -> State Int GameState
play [] = do
   stateValue <- get
   return stateValue
play (head:tail) = do
    stateValue <- get
    put (stateValue + head)
    play tail
