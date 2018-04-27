# 1_rotation_1.rb

# Start     8:17 PM
# End       8:

# Argument: an array
# Return: a new array
# Action: take first element of array passed and put it in the end and return this new transformed

def rotate_array(arr)
  output = arr.clone
  output.push(output.shift)
  output
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

