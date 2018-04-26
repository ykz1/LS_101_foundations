# 3_always_return_neg.rb

# Start:    4:32 PM
# End:      4:34 PM

def negative(int)
  -int.abs
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby