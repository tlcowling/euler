require 'matrix'

FIB_MATRIX = Matrix[[1,1],[1,0]]
def fib(n)
  (FIB_MATRIX**(n-1))[0,0]
end

start_time = Time.now
p fib(1_234_567_890_123)
p "#{(Time.now - start_time)} seconds"
# puts "Doesn't work !" unless (1..10).map { |i| i.fib } == [1, 1, 2, 3, 
# 5, 8,
# 13, 21, 34, 55]
