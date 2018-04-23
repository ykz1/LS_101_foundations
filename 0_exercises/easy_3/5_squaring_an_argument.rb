def multiply (num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square (5)
p square (-8)

puts "--- Further Exploration:"
def power(num, power)
  output = 1.0
  power.abs.times { output = multiply(output, num) }
  output = 1 / output if power < 0
  output
end

# Could also just num**power but that's cheating

p power(5, 3)
p power(-8, 3)
p power(5, 0)
p power(5, -3)