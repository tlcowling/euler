#Problem 89
#===============

=begin

The rules for writing Roman numerals allow for many ways of writing each number (see About Roman Numerals...). However, there is always a "best" way of writing a particular number.

For example, the following represent all of the legitimate ways of writing the number sixteen:

IIIIIIIIIIIIIIII
VIIIIIIIIIII
VVIIIIII
XIIIIII
VVVI
XVI

The last example being considered the most efficient, as it uses the least number of numerals.

The 11K text file, roman.txt (right click and 'Save Link/Target As...'), contains one thousand numbers written in valid, but not necessarily minimal, Roman numerals; that is, they are arranged in descending units and obey the subtractive pair rule (see About Roman Numerals... for the definitive rules for this problem).

Find the number of characters saved by writing each of these in their minimal form.

Note: You can assume that all the Roman numerals in the file contain no more than four consecutive identical units.

=end
timer_start = Time.now

before, after = 0,0

@@map = {
	"M" => 1000,
	"CM" => 900,
    "D"   => 500,
    "CD"   => 400,
    "C"   => 100,
    "XC"   => 90,
    "L"   => 50,
    "XL"   => 40,
    "X"   => 10,
    "IX"   => 9, 
    "V"   => 5, 
    "IV"   => 4, 
    "I"   => 1
}

def toRoman(number)
  result = ""
  
  @@map.each do |roman, arabic|
    while number >=arabic
      result += roman
      number -= arabic
    end
  end
    
  result
end

corrections = {
  'IIII' => 'IV', 'VIIII' => 'IX',
  'XXXX' => 'XL', 'LXXXX' => 'XC',
  'CCCC' => 'CD', 'DCCCC' => 'CM'
}

reg = /IIII|VIIII|XXXX|LXXXX|CCCC|DCCCC/

File.open("roman.txt", "r").lines {|roman|
  roman.chomp!
  before += roman.size
  roman.gsub!(reg) {|r| corrections[r] }
  after += roman.size
}


p "The difference is #{before - after}"
p "It took #{(Time.now - timer_start)*1000} milliseconds"