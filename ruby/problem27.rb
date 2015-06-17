#!/usr/bin/env ruby

#Problem 27

=begin

  Euler published the remarkable quadratic formula:
  
  n² + n + 41
  
  It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
  
  Using computers, the incredible formula  n²  79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, 79 and 1601, is 126479.
  
  Considering quadratics of the form:
  
  n² + an + b, where |a|  1000 and |b|  1000
  
  where |n| is the modulus/absolute value of n
  e.g. |11| = 11 and |4| = 4
  Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.

=end

timer_start = Time.now

require 'mathn'

max = 0
product = 0
formula = []

def equation_solution_for_coefficients(n,a,b)
  return n**2 + a*n + b
end

(-1000..1000).each {|a|
  next if a & 1 == 0
  (1..1000).each {|b|
    n = 0
    n += 1 until !equation_solution_for_coefficients(n,a,b).prime? 
    max, product, formula = n, a*b, [a,b] if (n>max)
  }
}

puts "27. #{product} (#{(Time.now- timer_start)*1000} ms)"
comment1 = "Its (n^2 + #{formula[0]}n + #{formula[1]}"
comment2 = "There product of the coefficients which produces the maximum number (#{max}) of primes for consecutive n is #{product}"
