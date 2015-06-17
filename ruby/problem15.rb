#!/usr/bin/env ruby
#Problem 15

=begin

#starting in the top corner of a 2x2 grid, there are 6 routes(without backtracking), to the bottom right

=end

# When alls said and done the solution is combinations and in this case 2NCN
# which becomes 40C20, i.e.

#   40!
# ------
# 20! 20!

# 21 * 22 * 23 etc
# ---
# 20!
timer_start = Time.now

answer = (21..40).reduce(:*) / (1..20).reduce(:*)

puts "15. #{answer} (#{(Time.now - timer_start)*1000} ms)"
