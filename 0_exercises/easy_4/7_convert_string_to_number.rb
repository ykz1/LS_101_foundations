def string_to_integer(str)
  int = 0
  str.length.times do |counter|
    power = str.length - counter - 1
    int += ('1'..str[counter]).count * 10**power
  end
  int
end


def string_to_integer2(str)
  sum = 0
  str.chars.each do |char|
    sum *= 10
    sum += ('1'..char).count
  end
  sum
end

def string_to_integer3(str)
  str.chars.inject(0) do |sum, char|
    sum *= 10
    sum += ('1'..char).count
  end
end


def string_to_integer4(str)
  str.chars.inject(0) { |sum, char| sum = sum * 10 + ('1'..char).count }
end

# Further Exploration - hex
def hex_digits(str)
  [('1'..str.downcase).count, 9].min + ('a'..str.downcase).count
end

def hexadecimal_to_integer(str)
  power = str.length
  sum = str.downcase.chars.map do |char|
    power -= 1
    hex_digits(char) * 16**power
  end
  sum.inject(:+)
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570

puts

p string_to_integer2('4321') == 4321
p string_to_integer2('570') == 570

puts

p string_to_integer3('4321') == 4321
p string_to_integer3('570') == 570

puts

p string_to_integer4('4321') == 4321
p string_to_integer4('570') == 570

puts

p hexadecimal_to_integer('4D9f') == 19871
