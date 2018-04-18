megacounter = 1

q = lambda do
  puts "----"
  puts "Q#{megacounter}"
  megacounter += 1
end

# --- Q1
q.call
puts "[1, 2, 3] because 'hi' will always evaluate to true"

a = [1, 2, 3].select do |num|
  num > 5
  'hi'
end

p a

# --- Q2
q.call

puts "2 because it counts the number of elements that returns true"
a = ['ant', 'bat', 'caterpillar'].count do |str|
  str.size < 4
end

p a

# --- Q3
q.call

puts "[1, 2, 3] because none get rejected; in the block all evalute to nil, which is false"
a = [1, 2, 3].reject do |num|
  puts num
end

p a

# --- Q4
q.call

puts "{ 'a' => 'ant', 'b' => 'bear', 'c' => 'cat' }"

a = ['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
p a

# --- Q5
q.call

puts "[:a, 'ant'] is returned"
puts "{b:=>'bear'} is what remains"
hash = { a: 'ant', b: 'bear' }
a = hash.shift
p a
p hash

# --- Q6
q.call
puts "11 because 'caterpillar' is returned from pop and its size is 11 characters"

p ['ant', 'bear', 'caterpillar'].pop.size

# --- Q7
q.call
puts "true is returned. any? asks whether there are any that evaluate true; 1 and 3 are odd"
puts '1 is printed, but now 2 or 3 because after 1 true any? stops iterating'

a = [1, 2, 3].any? do |num|
  puts num
  num.odd?
end

p a

# --- Q8
q.call

puts "[1, 2] returned. "
puts "[1, 2, 3, 4, 5] remains in original; is not destructive"

arr = [1, 2, 3, 4, 5]
a = arr.take(2)

p a
p arr

# --- Q9
q.call

puts "[nil, 'bear'] because if statements evaluates to false for 'ant' and returns nil"

a = { a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
p a

# --- Q10
q.call

puts "[1, nil, nil] because puts returns nil. prints out 2 and 3 though"

a = [1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

p a