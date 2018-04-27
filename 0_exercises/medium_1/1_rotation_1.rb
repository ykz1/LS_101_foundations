# 1_rotation_1.rb

# Start     8:17 PM
# End       8:21 PM
# Bonus     8:26 PM

# Argument: an array
# Return: a new array
# Action: take first element of array passed and put it in the end and return this new transformed

def rotate_array(arr)
  output = arr.clone
  output.push(output.shift)
  output
end

def rotate_array2(arr)
  arr[1..(arr.size - 1)] << arr[0]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

puts

p rotate_array2([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array2(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array2(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array2(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
