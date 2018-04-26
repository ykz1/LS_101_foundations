# arguments: 2 arrays
# return: 1 array with both
# side effects: none
def interleave(arr1, arr2)
  output_arr = []
  arr1.size.times do |idx|
    output_arr << arr1[idx]
    output_arr << arr2[idx]
  end
  output_arr
end

def interleave2(arr1, arr2)
  counter = 0
  arr1.each_with_object([]) do |ele, arr|
    arr << ele
    arr << arr2[counter]
    counter += 1
  end
end

def interleave3(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts

p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

puts

p interleave3([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']