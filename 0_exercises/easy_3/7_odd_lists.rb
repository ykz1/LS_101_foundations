def oddities(arr)
  arr.select.with_index { |_, index| index.even? }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
a = [1, 2, 3, 4, 5]
p oddities(a)
p a

# Further Exploration
puts

def evenites(arr)
  arr.select.with_index { |_, index| index.odd? }
end

def oddities_v2(arr)
  # Using most basic tools -- i.e. loop, break, next, <<, !
  output = []
  counter = -1
  skip = true
  loop do
    skip = !skip
    counter += 1
    break if counter == arr.size
    next if skip
    output << arr[counter]
  end
  output
end

def oddities_v3!(arr)
  # Mutates caller
  # Remove " + 1" for even"
  (arr.size / 2).times { |index| arr.slice!(index + 1) }
  arr
end

def oddities_v4!(arr)
  # Mutates caller a lot
  output = []
  while !arr.empty?
    # Flip the order of the following 2 lines for even
    output << arr.shift
    arr.shift
  end
  output
end

p "Evenites"
p evenites([2, 3, 4, 5, 6]) == [3, 5]
p evenites(['abc', 'def']) == ['def']
p evenites([123]) == []
p evenites([]) == []
a = [1, 2, 3, 4, 5]
p evenites(a)
p a

puts

p "oddities v2"
p oddities_v2([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_v2(['abc', 'def']) == ['abc']
p oddities_v2([123]) == [123]
p oddities_v2([]) == []
a = [1, 2, 3, 4, 5]
p oddities_v2(a)
p a

puts

p "oddities v3: mutates caller!"
p oddities_v3!([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_v3!(['abc', 'def']) == ['abc']
p oddities_v3!([123]) == [123]
p oddities_v3!([]) == []
a = [1, 2, 3, 4, 5]
p oddities_v3!(a)
p a

puts

p "oddities v4: mutates caller in a weird way!"
p oddities_v4!([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities_v4!(['abc', 'def']) == ['abc']
p oddities_v4!([123]) == [123]
p oddities_v4!([]) == []
a = [1, 2, 3, 4, 5]
p oddities_v4!(a)
p a
