#problem 72

=begin
	

=end

timer_start = Time.now

require 'mathn'

class Rational
	def reduced_proper_fraction?
		(self.numerator < self.denominator) && (self.numerator.gcd(self.denominator) == 1)
	end

	def self.take_reduced_proper_fractions_less_than(number)
		fractions = []

		(2..number).each{|denominator|
			(2..number).each{|numerator|
				if numerator >= denominator then next end
				temp = Rational(numerator,denominator)
				if temp.class == Fixnum then next end
				if temp.reduced_proper_fraction? then fractions.push(temp) end
			}
		}

		fractions

	end
end

p Rational.take_reduced_proper_fractions_less_than(10000).size

p "It took #{(Time.now - timer_start)*1000} milliseconds mate."
