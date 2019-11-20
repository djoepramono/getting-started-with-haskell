{-# LANGUAGE FlexibleContexts #-}

import Control.Monad.State

type GameState = Int
initialState = 100

stateExample :: IO ()
stateExample = do
    print $ execState (play3 [1,2,0,5]) initialState


-- play :: [Int] -> State GameState ()
-- play [] = do
--    stateValue <- get
--    return stateValue
-- play (head:tail) = do
--     stateValue <- get
--     put (stateValue + head)
--     play tail

-- play2 :: MonadState GameState m => [Int] -> m ()
-- play2 [] = do
--    stateValue <- get
--    return stateValue
-- play2 (head:tail) = do
--     stateValue <- get
--     put (stateValue + head)
--     play2 tail

play3 :: (MonadState Int m, MonadIO m) => [Int] -> m ()
play3 [] = do
   stateValue <- get
   _ <- liftIO $ putStrLn (show stateValue) 
   put stateValue
play3 (head:tail) = do
    stateValue <- get
    put (stateValue + head)
    _ <- liftIO $ putStrLn (show stateValue) 
    play3 tail