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

eval (EAdd left right) = eval left + eval right
eval (ESub left right) = eval left - eval right
eval (EMul left right) = eval left * eval right

leftNode (EAdd left _) = left
leftNode (ESub left _) = left
leftNode (EMul left _) = left

rightNode (EAdd _ right) = right
rightNode (ESub _ right) = right
rightNode (EMul _ right) = right

-- count the total number of arithmetic operations in an expression
countOps :: Expr -> Int
countOps (EInt _) = 0
countOps e        = (countOps $ leftNode e) + (countOps $ rightNode e) + 1

-- calculate the height of the expression tree
-- height of one node = 1
height :: Expr -> Int
height (EInt _) = 1

height e = max (height $ leftNode e) (height $ rightNode e) + 1

-- flatten the expression into a postfix string representation
-- use "(show i)" to convert int i to a string
postfix :: Expr -> String
postfix (EInt x)   = show x

postfix (EAdd left right) = postfix left ++ " " ++ postfix right ++ " +"
postfix (ESub left right) = postfix left ++ " " ++ postfix right ++ " -"
postfix (EMul left right) = postfix left ++ " " ++ postfix right ++ " *"


-- extract a sorted list of all unique integers in an expression
sort :: Ord t => [t] -> [t]
sort []     = []
-- this is a quicksort
sort (x:xs) = sort [y | y <- xs, y <= x] ++ [x] ++ sort [y | y <- xs, y > x]

uniq :: Ord t => [t] -> [t]
uniq []  = []
uniq [x] = [x]
uniq (x:y:ys)
 | x == y    = uniq (y:ys)
 | otherwise = x:(uniq (y:ys))

uniqInts :: Expr -> [Int]
uniqInts e = 
    let values = uints e
    in uniq $ sort values
    where
        uints (EInt x) = [x]
        uints e = (uints $ leftNode e) ++ (uints $ rightNode e) 
