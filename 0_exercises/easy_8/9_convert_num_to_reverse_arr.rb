# 9_convert_num_to_reverse_arr.rb

# Start     4:01 PM
# Finish    4:05 PM

# Argument: one integer
# Return: a new integer

def reversed_number(int)
  int.to_s.reverse.to_i
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # Note that zeros get dropped!
p reversed_number(1) == 1