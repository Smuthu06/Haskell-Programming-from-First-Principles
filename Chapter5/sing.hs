module sing where

fstString :: [Char] -> [Char]      -- Type signature use one (->)
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]     -- Wrong type declearation Char to [Char]
sndString x = x ++ " over the rainbow"  

sing x y = if (x > y) then fstString x else sndString y -- adding input arguments (x,y) to the sing function, Change or to else
    where x = "Singin"  -- intendation wrong
          y = "Somewhere"  -- chnged x to y