megacounter = 6

q = lambda do
  puts "----"
  puts "Q#{megacounter}"
  megacounter += 1
end

# --- Example 6
q.call

puts 'select iterates through each hash within the outer array and returns a new array of the hashes for which the block returns true'
puts 'all? is a method called on each hash as passed through the "hash" variable. it iterates through each element within the hash and returns true only if the inner block returns true for all elements within the has'
puts 'to_s is a method called on the keys within each hash to convert the keys to string'
puts 'within the inner block, the string value of each key is compared to the first character of each corresponding value. the truthiness is returned to all?'
puts
puts 'all? returns false for first hash because b does not equal e, and returns true for the second hash'
puts 'select returns only the second hash within a new array'
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

puts
puts 'if we used any? instead of all?, the new array returned would be the same as the original array, since a = a in [0][:a]'

# --- Example 10
megacounter = 10
q.call

puts "innermost map, first iteration: [2, 3]"
puts "innermost map, second iteration: [4, 5]"
puts "middle map, first iteration if statement is false, returns array of two innermost map's returned arrays: [[2, 3], [4, 5]]"
puts "middle map, second iteration if statement is true, returns array: [6, 7]"
puts "outer map returns: [[[2, 3], [4, 5]], [6, 7]]"

[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# --- Last one on mutating
puts "---"

puts "[[['a'], ['b'], ['c']]] is returned"
puts "[[[1], [2], [3], [4]]] is new value of arr"

arr = [[[1], [2], [3], [4]], [['a'], ['b'], ['c']]]
new_arr = arr.map do |arr2|
  arr.pop
end

p arr
p new_arr