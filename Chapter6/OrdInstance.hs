module OrdInstance where

data DayofWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun 

instance Eq DayofWeek where
    (==) Mon Mon = True
    (==) Tue Tue = True
    (==) Wed Wed = True
    (==) Thu Thu = True
    (==) Sat Sat = True
    (==) Fri Fri = True
    (==) Sun Sun = True
    (==) _   _   = True

instance Ord DayofWeek where
    compare Fri Fri = EQ
    compare Fri _   = GT
    compare _ Fri   = LT
    compare _ _     = EQ

instance Show DayofWeek where
    show Mon = "Monday"
    show Tue = "Tuesday"
    show Wed = "Wednesday"
    show Thu = "Thursday"
    show Fri = "Friday"
    show Sat = "Saturday"
    show Sun = "Sunday"


