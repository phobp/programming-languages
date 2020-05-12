--
-- CS 430 Spring 2019 P3 (Haskell 1)
--
-- Name: Brendan Pho
--

module P3 where

-- A list of all factors of n.
factors :: Integral a => a -> [a]
factors n = [x | x <- [1..n], n `mod` x == 0]

-- True iff n is prime.
isPrime :: Integral a => a -> Bool
isPrime n = factors n == [1, n]

-- A list of all prime factors of n.
primeFactors :: Integral a => a -> [a]
primeFactors n = filter isPrime (factors n)

-- A list of primes up to n.
primesUpTo :: Integral a => a -> [a]
primesUpTo n = [x | x <- [1..n], isPrime x]

-- True iff n is a perfect number.
-- A number n is perfect if the sum of its factors is 2*n.
isPerfect :: Integral a => a -> Bool
isPerfect n = n == sum [i | i <- [1..n-1], n `mod` i == 0]

-- A list of all perfect numbers up to n.
perfectUpTo :: Integral a => a -> [a]
perfectUpTo n = [x | x <- [1..n], isPerfect x]

-- The next prime greater than n.
nextPrime :: Integral a => a -> a
nextPrime n = head $ take 1 [ x | x <- [(n+1)..], isPrime x]

-- A list of the first n primes.
generatePrimes :: Integral a => a -> [a]
generatePrimes n = take (fromIntegral n) [x | x <- [2..], isPrime x]

