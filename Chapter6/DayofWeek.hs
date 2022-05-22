module DayofWeek where


data DayofWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving Show

data Date = Date DayofWeek Int deriving Show

instance Eq DayofWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Sat Sat = True
    (==) Fri Fri = True
    (==) Sun Sun = True
    (==) _   _   = True

instance Eq Date where
    (==) (Date weekday dayofMonth) (Date weekday' dayofMonth') = (weekday == weekday') && (dayofMonth == dayofMonth')