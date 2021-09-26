import HW2
import Prelude hiding (replicate, zipWith)
import Data.List

check v1 v2 = if v1 == v2 then True else False

main = 
    do
        -- problem 1
        print (check [1, 1, 1] (replicate 3 1))
        print (check [] (replicate 0 5))

        -- problem 2
        print (check [1, 2, 1, 2] (expunge 3 [1, 2, 3, 1, 2, 3]))
        print (check [2, 42, 4, 12, 3, 3, 5] (expunge 1 [1, 2, 42, 4, 12, 1, 3, 1, 3, 5, 1]))
        print (check [1, 2, 3, 2, 1] (expunge 4 [1, 2, 3, 2, 1]))
        print (check [] (expunge 1 []))

        -- problem 3
        print (check [2, 4, 6] (zipWith (+) [1..3] [1..3]))
        print (check [1..3] (zipWith const [1..3] [4..6]))
        print (check [[1, 4], [2, 5], [3, 6]] (zipWith (:) [1..3] [[4], [5], [6]]))

        -- problem 4
        print (check 3 (euclid 6 27))
        print (check 1 (euclid 10 3))
        print (check 33 (euclid 99 33))
        print (check 1 (euclid 1 3))

        -- problem 5
        -- print (check (insert 8 [1,2,3,9]) [1,2,3,8,9])
        -- print (check (insert 3 [1,4,7,9,10]) [1,3,4,7,9,10])
        -- print (check (insert  11 [1,4,7,9,10]) [1,4,7,9,10,11])
        -- print (check (insert 1 []) [1])
        -- print (check (insert 1 [1]) [1,1])

        print (check (isort  [1,8,2,4,5]) [1,2,4,5,8])
        print (check (isort  [3,2]) [2,3])
        print (check (isort "azyx") "axyz")
        print (check (isort "haskell") "aehklls")

        -- problem 6
        print (check (merge  [1,4,6] [2,3,8]) [1,2,3,4,6,8])
        print (check (merge  [100]  [1]) [1 ,100])
        print (check (merge [] [1,2,3]) [1,2,3])
        print (check (merge  [1,2,3] [3,4,5]) [1,2,3,3,4,5])

        print (check (msort  [1,8,4,2,3,1]) [1,1,2,3,4,8])
        print (check (msort  [1,10,2]) [1,2,10])
        print (check (msort  [1,2,3]) [1,2,3])
        print (check (msort  [1,7,6,5,4,3]) [1,3,4,5,6,7])
