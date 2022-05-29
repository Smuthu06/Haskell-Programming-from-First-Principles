module RegisteredUser where

newtype Username = Username String

newtype Accountno = Accountno Integer

data User = Unregistered | Registered Username Accountno

printUser :: User -> IO()
printUser Unregistered = putStrLn "Unregistered User"
printUser (Registered (Username name) (Accountno num)) = putStrLn (name ++ " " ++ show num)