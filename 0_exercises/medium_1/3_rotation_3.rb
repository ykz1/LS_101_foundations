# 3_rotation_3.rb

# Start     8:50 PM
# End       8:59 PM



def rotate_array(arr)
  arr[1..(arr.size - 1)] << arr[0]
end

def rotate_rightmost_digits(number, digits)
  arr = number.to_s.chars
  arr[-digits..-1] = rotate_array(arr[-digits..-1])
  arr.join.to_i
end

def max_rotation(int)
  size = int.to_s.length
  (-size..-1).each do |idx|
    int = rotate_rightmost_digits(int, idx.abs)
  end
  int
end



p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15  # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845