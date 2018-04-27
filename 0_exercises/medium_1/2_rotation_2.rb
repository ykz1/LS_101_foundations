# 2_rotation_2.rb

# Start     8:29 PM
# End       8:39 PM
#

def rotate_array(arr)
  arr[1..(arr.size - 1)] << arr[0]
end


def rotate_rightmost_digits(number, digits)
  arr = number.digits.reverse
  size = arr.size
  rotated_portion = rotate_array(arr.drop(size - digits))
  arr = arr.take(size - digits) << rotated_portion
  arr.flatten.join.to_i
end

def rotate_rightmost_digits2(number, digits)
  arr = number.to_s.chars
  arr[-digits..-1] = rotate_array(arr[-digits..-1])
  arr.join.to_i
end


p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

puts

p rotate_rightmost_digits2(735291, 1) == 735291
p rotate_rightmost_digits2(735291, 2) == 735219
p rotate_rightmost_digits2(735291, 3) == 735912
p rotate_rightmost_digits2(735291, 4) == 732915
p rotate_rightmost_digits2(735291, 5) == 752913
p rotate_rightmost_digits2(735291, 6) == 352917