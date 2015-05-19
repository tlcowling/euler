#Problem 81
#==============

=begin
In the 5 by 5 matrix below, the minimal path sum from the top left to the bottom right, by only moving to the right and down, is indicated in bold red and is equal to 2427.


131	673	234	103	18
201	96	342	965	150
630	803	746	422	111
537	699	497	121	956
805	732	524	37	331

Find the minimal path sum, in matrix.txt (right click and 'Save Link/Target As...'), a 31K text file containing a 80 by 80 matrix, from the top left to the bottom right by only moving right and down.

=end

require 'prime'

timer_start = Time.now

File.open File.join( File.dirname(__FILE__), 'problem81.txt' ) do |f|
  @values = f.readlines.map{|l| l.split(/[, ]/).map &:to_i }
end

@sums = [ [] ]

sum = 0
0.upto @values.length - 1 do |i|
  sum += @values.first[i]
  @sums.first << sum
end

1.upto @values.length - 1 do |i|
  @sums << [ @sums.last.first + @values[i].first ]

  1.upto @values.last.length - 1 do |j|
    @sums.last << [ @sums[i-1][j], @sums[i][j-1] ].min +  @values[i][j]
  end
end

puts @sums.last.last


p "This took #{(Time.now - timer_start)*1000} milliseconds to solve"
