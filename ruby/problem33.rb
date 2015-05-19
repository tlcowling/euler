#problem 33

require 'mathn'

timer_start = Time.now

fractions = []
i=1
j=2

until i>99 do
	until j>99 do
		fractions.push(i/j)
		j+=1
	end
	j=1
	i+=1
end


p "It took #{(Time.now - timer_start)*1000} milliseconds"