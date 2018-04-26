# 1_sum_of_sums.rb
# Start     2:30PM
# Finish    2:36PM
# Extra     

# Arguments: array
# Return: integer
# Action:
#   1. iterate through array
#   2. add to sum


def sum_of_sums(arr)
  sum = 0
  size = arr.size
  arr.each_with_index do |int, idx|
    sum += int * (arr.size - idx)
  end
  sum
end

def sum_of_sums2(arr)
  arr.each_with_index.map { |int, idx| int * (arr.size - idx) }.inject(:+)
end

def sum_of_sums3(arr)
  arr.size > 1 ? arr.sum + sum_of_sums3(arr.take(arr.size - 1)) : arr[0]
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

puts

p sum_of_sums2([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums2([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums2([4]) #== 4
p sum_of_sums2([1, 2, 3, 4, 5]) #== 35

puts

p sum_of_sums3([3, 5, 2]) #== (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums3([1, 5, 7, 3]) #== (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums3([4]) #== 4
p sum_of_sums3([1, 2, 3, 4, 5]) #== 35