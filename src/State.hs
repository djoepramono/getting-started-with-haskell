{-# LANGUAGE FlexibleContexts #-}

import Control.Monad.State

type GameState = Int
initialState = 100

-- State is a aggregtion of actions that can be applied onto an initial state point thing
-- execState executes each action and get the final state value
-- evalState exectues each action and get the final result 

stateExample :: IO ()
stateExample = do
    print $ execState (play2 [1,2,0,5]) initialState


play :: [Int] -> State GameState ()
play [] = do
    pure () -- at this point we have collected all actions, and thus dont do anything 
play (head:tail) = do
    stateValue <- get
    put (stateValue + head)
    play tail

-- In this variant, we can use execState and evalState to get 108. It is unnecesary duplication
-- It's currently not understood why the constraint is there
-- play2 :: MonadState GameState m => [Int] -> m Int 
play2 :: [Int] -> State GameState Int 
play2 [] = do
   stateValue <- get
   pure stateValue
play2 (head:tail) = do
    stateValue <- get
    put (stateValue + head)
    play2 tail

-- rewrite this!
-- play3 :: (MonadState Int m, MonadIO m) => [Int] -> m ()
-- play3 [] = do
--    stateValue <- get
--    _ <- liftIO $ putStrLn (show stateValue) 
--    put stateValue
-- play3 (head:tail) = do
--     stateValue <- get
--     put (stateValue + head)
--    _ <- liftIO $ putStrLn (show stateValue) 
--    play3 tail
