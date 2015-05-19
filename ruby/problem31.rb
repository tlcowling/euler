#Problem 31
#=========================

=begin

In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1£1 + 150p + 220p + 15p + 12p + 31p
How many different ways can £2 be made using any number of coins?

=end

timer_start = Time.now

# Euler 31
# http://projecteuler.net/index.php?section=problems&id=31
# In England the currency is made up of pound, £, and pence,
# p, and there are eight coins in general circulation:
#
# 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
#
# It is possible to make £2 in the following way:
# 1x£1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
#
# How many different ways can £2 be made using any number of coins?
timer_start = Time.now

def pence(i)
  1
end

def two_pence(i)
  i >= 0 ? two_pence(i-2) + pence(i) : 0
end

def five_pence(i)
  i >= 0 ? five_pence(i-5) + two_pence(i) : 0
end

def ten_pence(i)
  i >= 0 ? ten_pence(i-10) + five_pence(i) : 0
end

def twenty_pence(i)
  i >= 0 ? twenty_pence(i-20) + ten_pence(i) : 0
end

def fifty_pence(i)
  i >= 0 ? fifty_pence(i-50) + twenty_pence(i) : 0
end

def pound(i)
  i >= 0 ? pound(i-100) + fifty_pence(i) : 0
end

def two_pound(i)
  i >= 0 ? two_pound(i-200) + pound(i) : 0
end

puts two_pound(200)

puts "Elapsed Time: #{(Time.now - timer_start)*1000} milliseconds"

# Refactored solution
timer_start = Time.now

$coin_values = [1, 2, 5, 10, 20, 50, 100, 200]

def change_count(change, coin_values_index)
  return 1 if coin_values_index == 0
  return 0 if change <  0
  change_count(change - $coin_values[coin_values_index], \
    coin_values_index) + change_count(change, coin_values_index - 1)
end

puts change_count(200, 7)

p "It took #{(Time.now - timer_start)*1000} milliseconds"