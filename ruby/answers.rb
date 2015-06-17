#!/usr/bin/env ruby
#
# Prints all Project Euler Answers and how long each took
#

timer_start = Time.now
n = 22

(1..n).each {|i|
  require_relative "problem#{i}.rb"
}

puts "Altogether it took #{(Time.now - timer_start)*1000} ms"
