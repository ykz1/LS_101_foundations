# 7_multiplicative_average.rb
# Start    1:35PM
# Finish   1:43PM

# Arguments: array of int
# Side-effect: print output of some action (to 3 decimals)
# Action: multiply all ints, divide by count of ints

def show_multiplicative_average(arr)
  puts "The result is #{format('%.3f', arr.inject(:*).to_f / arr.size)}"
end

show_multiplicative_average([3, 5]) # => The result is 7.500

show_multiplicative_average([6]) # => The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667