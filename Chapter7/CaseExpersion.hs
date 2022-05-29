module CaseExpersion where

funcZ x =
    case x+1 == 1 of
        True -> "Awsome"
        False -> "Woot"

palindrom x =
    case x == reverse x of
        True -> "Yes"
        False -> "No"

palindrom' c = 
    case y of
        True -> "Yes"
        False -> "No"
        where y = c == reverse c


