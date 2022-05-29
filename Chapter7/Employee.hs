module Employee where

    
data Emp = Coder
           |Manager
           |Veep
           |CEO
           deriving (Ord, Eq, Show)


reportBoss :: Emp -> Emp -> IO()
reportBoss e e' = putStrLn $ show e ++ " is the boss of " ++ show e'

empRank :: (Emp -> Emp -> Ordering) -> Emp -> Emp -> IO()
empRank f e e' =
    case f e e' of
        GT -> reportBoss e e'
        EQ -> putStrLn "Neither Employee is the boss"
        LT -> (flip reportBoss) e e'

codersRule :: Emp -> Emp -> Ordering
codersRule Coder Coder = EQ
codersRule Coder _     = GT
codersRule _     Coder = LT
codersRule e     e'    = compare e e'


