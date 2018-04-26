# 8_multiply_lists.rb
# Start     1:44PM
# Finish    1:50PM
# Extras    2:01PM

# ARguments: 2 arrays
# return: 1 array
# transformation: multiple each element-pair between 2 arrays and put product into returning array


def multiply_list(arr1, arr2)
  (1..arr1.size).each_with_object([]) { |idx, output| output << arr1[idx - 1] * arr2[idx - 1] }
end

def multiply_list2(arr1, arr2)
  arr1.zip(arr2).map { |arr| arr.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
p multiply_list2([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
p multiply_list3([3, 5, 7], [9, 10, 11]) #== [27, 50, 77]
