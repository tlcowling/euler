require 'date'

first = Date.new(1901,1,1)
last = Date.new(2000,12,31)

date_range = (first..last)

p date_range.find_all {
	|day|
	day.mday == 1 && day.wday == 0
}.count
