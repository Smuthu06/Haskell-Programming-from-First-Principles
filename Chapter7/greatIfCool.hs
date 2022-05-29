module GreateIfCool where

greateIfCool :: String -> IO()
greateIfCool coolness =
    case cool of
        True -> putStrLn " eyyyyy whats shakin"
        False -> putStrLn "pshhhh"
        where cool = coolness == "downright frosty yo"