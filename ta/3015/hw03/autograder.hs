import HW3

check v1 v2 = if v1 == v2 then True else False

main =
    do 
        -- problem 1
        print "Problem 1 - 5pts"
        print (check (oscMap (+10) (+100) [1,2,3,4]) [11, 102, 13, 104])
        print (check (oscMap (1-) (1+) [1..5]) [0, 3, -2, 5, -4])
        print ""

        -- problem 2
        print "Problem 2 - 5pts"
        print "Cons 1 (Cons 2 (Cons 3 Nil))"
        print (app (HW3.Cons 1 (HW3.Cons 2 HW3.Nil)) (HW3.Cons 3 HW3.Nil))
        print "Cons 3 (Cons 4 (Cons 5 (Cons 6 Nil)))"
        print (app (HW3.Cons 3 HW3.Nil) (HW3.Cons 4 (HW3.Cons 5 (HW3.Cons 6 HW3.Nil))))
        print ""

        -- problem 3
        print "Problem 3 - 10pts"
        print (check (list2int [1..3]) 123)
        print (check (list2int [0, 1, 2, 3]) 123)
        print (check (list2int [0, 1, 2, 3, 0]) 1230)
        print (check (list2int [0, 1, 2, 3, 0, 4, 5]) 123045)
        print (check (list2int [0, 0, 0, 0]) 0)
        print ""

        print "Problem 4 - 50pts total"

        -- problem 4a
        print "Problem 4a - 5pts"
        print (check (size Leaf) 0)
        print (check (size (Node 10 Leaf Leaf)) 1)
        print (check (size (Node 10 (Node 8 Leaf  Leaf) (Node 20 (Node 15 Leaf  Leaf) Leaf))) 4)
        print ""

        -- problem 4b
        print "Problem 4b - 5pts"
        print "Node 10 Leaf Leaf"
        print (insert 10 (Leaf))
        print "Node 10 (Node 8 Leaf Leaf) Leaf"
        print (insert 8 (Node 10 Leaf  Leaf))
        print "Node 10 (Node 8 Leaf Leaf) (Node 15 Leaf Leaf)"
        print (insert  15 (Node 10 (Node 8 Leaf  Leaf) Leaf))
        print ""

        -- problem 4c
        print "Problem 4c - 5pts"
        print "[10]"
        print (squash (Node 10 Leaf  Leaf))
        print "[8, 10]"
        print (squash (Node 10 (Node 8 Leaf  Leaf) Leaf))
        print "[8, 10, 15]"
        print (squash (Node 10 (Node 8 Leaf  Leaf) (Node 15 Leaf  Leaf)))
        print ""

        -- problem 4d
        print "Problem 4d - 5pts"
        print "Node 10 Leaf Leaf"
        print (unsquash [10])
        print "Node 10 Leaf (Node 8 Leaf  Leaf)"
        print (unsquash  [8,10])
        print "Node 10 (Node 2 (Node 1 Leaf  Leaf) (Node 3 Leaf  Leaf)) Leaf"
        print (unsquash  [1,3,2,10])

        -- problem 4e
        -- print "Problem 4e - 5pts"
        -- print (check (treesort [3, 2, 1]) [1..3])
        -- print (check (treesort [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]) [1..10])
        -- print ""

        -- problem 4f
        -- this one is used in 4g. if it the next doesn't work, check by hand
        print "Problem 4f - 10pts"
        print ""

        -- problem 4g
        print "Problem 4g - 5pts"
        print (check (treesum Leaf) 0)
        print (check (treesum (Node 3 Leaf Leaf)) 3)
        print (check (treesum (Node 10 (Node 3 Leaf (Node 8 Leaf  Leaf)) (Node 7 Leaf  Leaf))) 28)
        print ""

        -- problem 4h
        -- print "Problem 4h - 10pts"
        -- print (Leaf == Leaf)
        -- print ((Node 3 Leaf  Leaf) == (Node 2 (Node 1 Leaf  Leaf) Leaf))
        -- print (not ((Node 3 Leaf  Leaf) == (Node 2 (Node 2 Leaf  Leaf) Leaf)))
        -- print ((Node 3 Leaf  Leaf) /= (Node 2 (Node 2 Leaf  Leaf) Leaf))
        -- print ""

        -- print "Extra Credit:"
        -- print "Problem 4i - 5pts"
        -- print (check (depth Leaf) 0)
        -- print (check (depth (Node 10 Leaf  Leaf)) 1)
        -- print (check (depth (Node 10 Leaf (Node 10 Leaf  Leaf))) 2)
        -- print (check (depth (Node 10 Leaf (Node 10 Leaf (Node 3 Leaf  Leaf)))) 3)
        -- print (check (depth (Node 10 Leaf (Node 10 (Node 3 Leaf  Leaf) (Node 3 Leaf  Leaf)))) 3)