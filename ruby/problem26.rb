#Problem 27
#==================

=begin

A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:

1/2	= 	0.5
1/3	= 	0.(3)
1/4	= 	0.25
1/5	= 	0.2
1/6	= 	0.1(6)
1/7	= 	0.(142857)
1/8	= 	0.125
1/9	= 	0.(1)
1/10	= 	0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d  1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.

=end
timer_start = Time.now

require 'mathn'

number, maximum_length = 0,0

def recurring_cycle_length(n)
	return 0 if n%2==0 || n%5==0
	i=1
	until (((10**i)-1) %n) ==0
		i+=1
	end
	i
end

Prime.each {|d|
	break if d>= 1000

	recurring_length = recurring_cycle_length(d)
	number, maximum_length = d, recurring_length if recurring_length > maximum_length

}

p "The value of d for which 1/d has the longest recurring cycle is d=#{number}"
p "The cycle is #{maximum_length} digits"
p "It took #{(Time.now- timer_start)*1000} milliseconds"
