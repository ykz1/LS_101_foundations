def xor?(boo1, boo2)
  # This is the long version of how the logic works
  (boo1 && !boo2) || (!boo1 && boo2)
end

def xor2?(boo1, boo2)
  # This is a simplified version
  boo1 != boo2
end

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
puts

p xor2?(5.even?, 4.even?) == true
p xor2?(5.odd?, 4.odd?) == true
p xor2?(5.odd?, 4.even?) == false
p xor2?(5.even?, 4.odd?) == false

puts "Another example...we're looking for volunteers to go upstairs and change the broken lightbulb."
puts "...there are 2 candidates, and we're all set if only one of them volunteers."
puts
puts "Short circuiting xor does not make sense. By definition we need both arguments to be evaluated."
puts "In comparison..."
puts "...in &&, if the first argument is false, the second argument is moot"
puts "...similarly in ||, if the first argument is true, the second argument is moot"