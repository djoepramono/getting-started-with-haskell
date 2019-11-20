{-# LANGUAGE InstanceSigs #-}

data Person = Person {name :: String, age :: Int} 

instance Show Person where
  show :: Person -> String
  show person = name person


run :: [Char] 
run = do 
  let jacqui = Person "Jacqui" 1
  show jacqui
