#!/usr/bin/env ruby

#Problem 2

=begin

Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

=end

timer_start = Time.now

@fibs = [1,2]

def fib(n)
  return @fibs[n] if @fibs[n]
  @fibs[n] = fib(n-1) + fib(n-2)
  return @fibs[n]
end

n=0
even_sum = 0

begin
  fib = fib(n)
  even_sum += fib if fib.even?
  n += 1
end while fib(n) <= 4000000

puts "2. #{even_sum} (#{(Time.now-timer_start)*1000}ms)"
