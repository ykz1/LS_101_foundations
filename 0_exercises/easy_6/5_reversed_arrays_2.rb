def reverse(arr)
  new_arr = arr.clone
  reverse!(new_arr)
  # (arr.size / 2).times do |count|
  #   new_arr[count], new_arr[-(count + 1)] = arr[-(count + 1)], arr[count]
  # end
  # new_arr
end

def reverse!(arr)
  arr.each_with_index { |_, idx| arr.insert(idx, arr.pop) }
end

def reverse2(arr)
  arr.each_with_object([]) { |ele, ar2| ar2.unshift(ele) }
end 

def reverse3(arr)
  arr.inject([]) { |ar2, ele| ar2.unshift(ele) }
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true

puts

p reverse2([1,2,3,4]) == [4,3,2,1]          # => true
p reverse2(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse2(['abc']) == ['abc']              # => true
p reverse2([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse2(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true

puts

p reverse3([1,2,3,4]) == [4,3,2,1]          # => true
p reverse3(%w(a b c d e)) == %w(e d c b a)  # => true
p reverse3(['abc']) == ['abc']              # => true
p reverse3([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse3(list)              # => [3, 2, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 2, 3]                     # => true
p new_list == [3, 2, 1]                 # => true