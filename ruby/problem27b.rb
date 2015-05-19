#alternative 27
class Prime_Generator

  attr_reader :stack

  def initialize max = 3
    @stack  = [1,2,3]
    fill_to max
  end

  def fill_to max	
    n = 1
    while true do
      n += 4
      return @stack if n > max
      @stack << n if is_prime? n
  
      n += 2
      return @stack if n > max
      @stack << n if is_prime? n          
    end
  end
  
  def is_prime? n
    return false if n <= 0
    max = Math.sqrt(n).floor
    fill_to(max + 1) if max > @stack.last
  
    @stack.each do |i|
      next if i == 1
      return true if i > max
      return false if n % i == 0
    end
  
    true
  end
end

# require 'prime_generator'

# pre-calculate primes
MAX     = 1_000
primer  = Prime_Generator.new MAX
primes  = primer.stack
product = 0
highest = 0

# a must be odd
(0..MAX).each do |i| 
  next if i & 1 == 0

  # b must be prime
  primes.each do |b|
    
    # a can be positive or negative
    [i,-i].each do |a|
      n = 0
      while n += 1 do
        break unless primer.is_prime?(n ** 2 + a * n + b)
      end

      if highest < n
        highest = n
        product = a * b
      end

    end
  end
end

puts product