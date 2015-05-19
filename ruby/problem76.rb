#Problem 76
#================

=begin

It is possible to write five as a sum in exactly six different ways:

4 + 1
3 + 2
3 + 1 + 1
2 + 2 + 1
2 + 1 + 1 + 1
1 + 1 + 1 + 1 + 1

How many different ways can one hundred be written as a sum of at least two positive integers?

=end

#               4+1       3+
#               3+2       3+2+1
#       3+1     3+1+1     3+1+1+1
#       2+2     2+2+1     2+2+1+1
# 2+1   2+1+1   2+1+1+1   2+1+1+1+1
# 1+1+1 1+1+1+1 1+1+1+1+1 1+1+1+1+1+1
# 3		4		5			6			8
# 2		4		6			8			10

# 1       2       3           4           5

