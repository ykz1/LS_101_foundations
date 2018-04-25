# Simplest solution
def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end

# Further Exploration: Using each_with_object
def running_total2(arr)
  sum = 0
  arr.each_with_object([]) { |num, output| output << sum += num }
end

# Further Exploration: Using inject
def running_total3(arr)
  output = []
  arr.size.times { |count| output << arr[0..count].inject(:+)}
  output
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p running_total([1, 1, 2, 3, 3, 5, 2])

puts

p running_total2([2, 5, 13])
p running_total2([14, 11, 7, 15, 20])
p running_total2([3])
p running_total2([])
p running_total2([1, 1, 2, 3, 3, 5, 2])

puts

p running_total3([2, 5, 13])
p running_total3([14, 11, 7, 15, 20])
p running_total3([3])
p running_total3([])
p running_total3([1, 1, 2, 3, 3, 5, 2])