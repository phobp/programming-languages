--
-- CS 430 Spring 2019 P4 (Haskell 2)
--
-- Name: Brendan Pho
--

module P4 where
import Defs

-- calculate the result of an expression
eval :: Expr -> Int
eval (EInt x) = x
eval (EAdd l r) = (eval l) + (eval r)
eval (ESub l r) = (eval l) - (eval r)
eval (EMul l r) = (eval l) * (eval r)

leftChild (EAdd l _) = l
leftChild (ESub l _) = l
leftChild (EMul l _) = l

rightChild (EAdd _ r) = r
rightChild (ESub _ r) = r
rightChild (EMul _ r) = r

-- count the total number of arithmetic operations in an expression
countOps :: Expr -> Int
countOps (EInt _) = 0
countOps e        = 1 + (countOps $ leftChild e) + (countOps $ rightChild e) 

-- calculate the height of the expression tree
-- height of one node = 1
height :: Expr -> Int
height (EInt _) = 1
height e = 1 + max (height $ leftChild e) (height $ rightChild e) 

-- flatten the expression into a postfix string representation
-- use "(show i)" to convert int i to a string
postfix :: Expr -> String
postfix (EInt x)   = show x
postfix (EAdd l r) = postfix l ++ " " ++ postfix r ++ " +"
postfix (ESub l r) = postfix l ++ " " ++ postfix r ++ " -"
postfix (EMul l r) = postfix l ++ " " ++ postfix r ++ " *"

-- Quick sort
sort :: Ord t => [t] -> [t]
sort []     = []
sort (x:xs) = 
    l ++ [x] ++ r
    where
        l = sort $ filter (<x) xs
        r = sort $ filter (>=x) xs

-- Only works if input is sorted: 
uniq :: Ord t => [t] -> [t]
uniq []  = []
uniq [x] = [x]
uniq (x:y:ys)
 | x == y    = uniq (y:ys)
 | otherwise = x:(uniq (y:ys))

-- extract a sorted list of all unique integers in an expression
uniqInts :: Expr -> [Int]
uniqInts e = 
    let vals = uniqIntsH e
    in uniq $ sort vals
    where
        uniqIntsH (EInt x) = [x]
        uniqIntsH e = (uniqIntsH $ leftChild e) ++ (uniqIntsH $ rightChild e) 
