data Person = Person {name :: String, age :: Int} deriving (Show)

run :: [Char] 
run = do 
  let jacqui = Person "Jacqui" 1
  show jacqui
