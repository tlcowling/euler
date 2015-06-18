#!/usr/bin/env ruby

# Problem 14

=begin

  The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)
  
  Using the rule above and starting with 13, we generate the following sequence:
  
  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
  
  Which starting number, under one million, produces the longest chain?
  
  NOTE: Once the chain starts the terms are allowed to go above one million.

=end

timer_start = Time.now

def iterate(n)
  (n % 2 == 0) ? (n/2) : 3*n+1
end

def number_of_terms(start)
  times = 0
  while start != 1 do
    start = iterate(start)
    times += 1
  end
  times + 1
end

answer = 0

(1..1000000).each { |x| 
  terms = number_of_terms(x)
  answer = x if terms > answer
}

# An attempt at a multithreaded version... so slow
# Each thread will get 100000 calculations to make
#threads = []

#total = 1000000
#tn = 10
#eachcount = total/tn
#answers_for_threads = []
#
#(0..tn).each{ |thread_number|
#  threads << Thread.new {
#    start = (thread_number*eachcount) + 1
#    finish   = eachcount*tn
#    highest = 0
#    (start..finish).each {|x|
#      terms = number_of_terms(x)
#      if terms > highest
#        highest = terms
#      end
#    }
#    answers_for_threads << highest
#  }
#}
#
#threads.each { |thr| thr.join }
#puts answers_for_threads
#answer = answers_for_threads.max

puts "14. #{answer} (#{(Time.now - timer_start)*1000}) ms)"
