# 9_multiply_all_pairs.rb
# Start     2:01PM
# Finish    2:08PM
# Extras    2:13PM

# Arguments: 2 arrays of numbers
# Return: new array
# Action: 
#     1. multiple all possible pairs between two arrays
#     2. sort products in ascending order

# Forks:
#.    1. zip vs iterate

def multiply_all_pairs(arr1, arr2)
  output = arr1.each_with_object([]) do |int, arr|
    arr2.each do |int2|
      arr << int * int2
    end
  end
  output.sort
end

def multiply_all_pairs2(arr1, arr2)
  arr1.product(arr2).map { |arr| arr.inject(:*) }.sort
end
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]
p multiply_all_pairs2([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]