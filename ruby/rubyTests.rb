#!/usr/bin/ruby

for i in 0..5
  if i < 2 then
    next
  end
  puts "Value of local variable is #{i}"
end

def gibletify(x)
  x**3 - x**2
end

bollocks = (2..40).map do |x| "#{x}^3 - #{x}^2 = #{gibletify(x)}\n" end
  
print bollocks
