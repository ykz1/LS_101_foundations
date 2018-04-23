
def is_odd?(int)
  int % 2 == 1
end

def is_odd2?(int)
  (int.remainder(2))**2 == 1
end

puts "Enter an integer"
input = gets.chomp.to_i
puts is_odd?(input)
puts

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
puts

puts is_odd2?(2)    # => false
puts is_odd2?(5)    # => true
puts is_odd2?(-17)  # => true
puts is_odd2?(-8)   # => false
puts is_odd2?(0)    # => false
puts is_odd2?(7)    # => true