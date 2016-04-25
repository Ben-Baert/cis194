toDigitsRev :: Integer -> [Integer]
toDigitsRev 0 = []
toDigitsRev n = n `rem` 10 : toDigitsRev (n `div` 10)

toDigits :: Integer -> [Integer]
toDigits = reverse . toDigitsRev

doubleEveryOther :: [Integer] -> [Integer]
doubleEveryOther = reverse . zipWith (*) (cycle [1,2]) . reverse

sumDigits :: [Integer] -> Integer
sumDigits = sum . concatMap toDigits

validate :: Integer -> Bool
validate = (==0) . flip rem 10 . sumDigits . doubleEveryOther  . toDigits
