# 9_does_my_list_include.rb
def include?(arr, val)
  arr.any?(val)
end

def include2?(arr, val)
  arr.inject(bool = false) { |bool, ele| bool = (bool || (ele == val)) }
end

def include3?(arr, val)
  !!arr.index(val)
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

puts

p include2?([1,2,3,4,5], 3) == true
p include2?([1,2,3,4,5], 6) == false
p include2?([], 3) == false
p include2?([nil], nil) == true
p include2?([], nil) == false

puts

p include3?([1,2,3,4,5], 3) == true
p include3?([1,2,3,4,5], 6) == false
p include3?([], 3) == false
p include3?([nil], nil) == true
p include3?([], nil) == false