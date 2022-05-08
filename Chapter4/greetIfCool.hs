module greetIfCool where


greetIfCool :: String -> IO()
greetIfCool coolness = 
    if cool
        then putStrLn "eyyyy. Whats shakin"
    else
        putStrLn "Pshhh"
    where cool = 
        coolness == "downrigth frosty yo"