def single_int_to_str(int)
  ((int.ord - 1.ord) + '1'.ord).chr
end
def integer_to_string(int)
  output = ''
  loop do
    char = single_int_to_str(int % 10)
    output = char + output
    int /= 10
    break if int <= 0
  end
  output
end

def integer_to_string2(int)
  output = ''
  loop do
    int, digit = int.divmod(10)
    output = single_int_to_str(digit) + output
    break if int == 0
  end
  output
end

def integer_to_string3(int)
  int.digits.reverse.join
end

def single_int_to_hex(int)
  if int < 10
    ((int.ord - 1.ord) + '1'.ord).chr
  else
    ((int.ord - 10.ord) + 'a'.ord).chr
  end
end

def int_to_hex_str(int)
  arr = int.digits(16).reverse
  arr.map { |num| single_int_to_hex(num) }.join.upcase
end



p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

puts

p integer_to_string2(4321) == '4321'
p integer_to_string2(0) == '0'
p integer_to_string2(5000) == '5000'

puts

p integer_to_string3(4321) == '4321'
p integer_to_string3(0) == '0'
p integer_to_string3(5000) == '5000'

puts

p int_to_hex_str(19871) == '4D9F'
p int_to_hex_str(20180423) == '133EDC7' #today's date in hex