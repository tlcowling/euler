#Problem 15
#==============
#starting in the top corner of a 2x2 grid, there are 6 routes(without backtracking), to the bottom right

class Integer
	def choose(k)
		(self - k+1 .. self).inject(1, &:*)/(2..k).inject(1,&:*)
	end
end

countMoreThanOneMillion =0

(1..100).each {
	|number| 
	rvalues = (1..number).to_a
	rvalues.each {
		|value| 
		if number.choose(value) > 1000000
			countMoreThanOneMillion = countMoreThanOneMillion+1
		end
	}

}

p countMoreThanOneMillion