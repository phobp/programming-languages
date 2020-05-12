#
# CS 430 Spring 2019 P1 (Ruby 1)
#
# Name: Brendan Pho
#

# return an array of all factors of n
require 'prime'

def factors (n)
    return (1..n).select { |x| n%x==0 }
end

# return an array of all prime numbers less than or equal to n
def primes (n)
    return (1..n).select { |x| x.prime? }
end

# return an array of all prime factors of n
def prime_factors (n)
    return (1..n).select { |x| n%x==0 and x.prime? }
end

# return an array of all perfect numbers less than or equal to n
def perfects (n)
    return (1..n).select { |x| x==(1...x).select { |i| x%i==0 }.inject(:+) }
end

# return an array of Pythagorean triples whose elements are less than or equal to n
def pythagoreans (n)
    return (1..n).to_a.permutation(3).to_a.select { |a,b,c| a**2 + b**2 == c**2 }.each(&:sort!).uniq
end
