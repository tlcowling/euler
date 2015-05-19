#Problem 57 ruby

require 'mathn'

def continue_fraction_root2(times=0)
	if(times==0) then return 0
	else 
		contfrac = 1/(2+continue_fraction_root2(times-1))

		return contfrac
	end
end

def continued_root2(times)

	return 1 + continue_fraction_root2(times)
end

i=0
numbigs=0
until (i>1000) 
	if(continued_root2(i).numerator.to_s.length>continued_root2(i).denominator.to_s.length) then numbigs+=1 end
	i+=1
end



p "The number of fractions with a numerator with more digits than the denominator in the first 1000 iterations of the continued fraction approximation of root 2 is #{numbigs}"