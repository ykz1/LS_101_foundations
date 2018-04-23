def digit_list(int)
  str = int.to_s
  arr = []
  counter = 0
  loop do
    break if counter == str.length
    arr << str[counter].to_i
    counter += 1
  end
  arr
end

def digit_list2(int)
  int.to_s.chars.map(&:to_i) # { |char| char.to_i }
end

def digit_list3(int)
  arr = []
  loop do
    arr.unshift(int % 10)
    break if int < 10
    int /= 10
  end
  arr
end

def digit_list4(int)
  arr = []
  loop do
    int, add = int.divmod(10)
    arr.unshift(add)
    break if int == 0
  end
  arr
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true

puts

puts digit_list3(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list3(7) == [7]                     # => true
puts digit_list3(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list3(444) == [4, 4, 4]             # => true

puts

puts digit_list4(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list4(7) == [7]                     # => true
puts digit_list4(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list4(444) == [4, 4, 4]             # => true