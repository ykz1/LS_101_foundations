def average(arr)
  arr.inject(:+) / arr.size
end

def average2(arr)
  arr.inject(:+).to_f / arr.size.to_f
end

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

puts average2([1, 2])