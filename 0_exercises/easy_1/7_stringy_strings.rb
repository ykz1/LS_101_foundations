def stringy(int)
  num = 0
  output = ''

  int.times do
    num = 1 - num
    output += num.to_s
  end

  output
end

def stringy2(int, start = 1)
  output = ''

  int.times do
    output += start.to_s
    start = 1 - start
  end

  output
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts 

puts stringy2(6)
puts stringy2(6, 0)
puts

puts stringy2(9)
puts stringy2(9, 0)
puts

puts stringy2(4)
puts stringy2(4, 0)
puts

puts stringy2(7)
puts stringy2(7, 0)
