hash = {
  'IIII' => 'IV', 'VIIII' => 'IX',
  'XXXX' => 'XL', 'LXXXX' => 'XC',
  'CCCC' => 'CD', 'DCCCC' => 'CM'
}
reg = /IIII|VIIII|XXXX|LXXXX|CCCC|DCCCC/
before, after = 0, 0

File.open("roman.txt", "r").lines {|roman|
  roman.chomp!
  before += roman.size
  roman.gsub!(reg) {|r| hash[r] }
  after += roman.size
}
p before - after
