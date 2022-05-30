module Integral_Division where

type Numerator   = Integer
type Denominator = Integer
type Quotient    = Integer
type Reminder    = Integer

devideBy :: Numerator -> Denominator -> (Quotient, Reminder)
devideBy n d = go n d 0
    where go n d count
            | n < d     = (count, n)
            | otherwise = go (n - d) d (count +1)