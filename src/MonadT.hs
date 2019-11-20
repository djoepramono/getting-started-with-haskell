{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE FlexibleContexts #-}
module MonadT where

import Control.Monad.State
import Control.Monad.Trans

doTheThing :: (MonadState Int m, MonadIO m) => m ()
doTheThing = do
  counter <- get
  _ <- liftIO $ putStr "Enter a number: "
  input <- liftIO getLine
  let number = read input
  let newCounter = increment number counter
  _ <- liftIO $ putStrLn $ "counter = " ++ (show newCounter)
  _ <- put newCounter
  doTheThing


-- do
--    putStr "Enter a number: "
--    input <- getLine
--    let number = read input
--    let newCounter = increment number counter
--    putStrLn $ "counter = " ++ (show newCounter)
--    doTheThing newCounter

-- newtype App a = App { unApp :: StateT Int IO a }
--   deriving (MonadState Int, MonadIO, Monad, Applicative, Functor)

increment :: Int -> Int -> Int
increment input counter = input + counter

run :: IO ()
run = evalStateT doTheThing 0

