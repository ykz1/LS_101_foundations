def find_fibonacci_index_by_length(int)
  counter = 2
  prev1 = 1
  prev2 = 1
  limit = 10**(int-1)
  loop do    
    counter += 1
    num = prev1 + prev2
    break if num >= limit
    prev2 = prev1
    prev1 = num
  end
  counter
end

p find_fibonacci_index_by_length(2) #== 7
p find_fibonacci_index_by_length(10) #== 45
p find_fibonacci_index_by_length(100) #== 476
p find_fibonacci_index_by_length(1000) #== 4782
p find_fibonacci_index_by_length(10000) #== 47847