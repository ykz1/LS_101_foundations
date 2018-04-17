megacounter = 1

q = lambda do
  puts
  puts "--- Q#{megacounter}"
  megacounter += 1
end

# --- Q1
q.call

puts '[1, 2, 3, 3]. uniq does not mutate the caller. uniq!, instead, would return [1, 2, 3]'

numbers = [1, 2, 2, 3]
numbers.uniq
p numbers

# --- Q2
q.call
puts '1. != is does not equal, used for comparisons'
puts '2. ! before something negates its truthiness. it makes true false, and false true'
puts '3. ! after something is a part of the variable or method...usually indicates a mutating method'
puts '4. by itself, ? is used after the condition in a ternary if statement'
puts '5. ? at the end of a method usually indicates a method that returns true/false (by convention, not necessity'
puts '6. !! before something is a double negation of its truthiness and useless...turns an object into its boolean equiv'

# --- Q3
q.call

advice = 'Few things in life are as important as house training your pet dinosaur'
advice.gsub!('important', 'urgent')
puts advice

# --- Q4
q.call
puts 'numbers.delete_at(1) deletes at index value [1], which is the second in the array -- the number 2'
puts '[1, 3, 4, 5]'
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers

puts 'numbers.delete(1) deletes all instances of the number 1 in the array -- the number at index value [0]'
puts '[2, 3, 4, 5]'
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)
p numbers

puts 'test to make sure that delete() removes all instances'
puts '[2, 3, 4, 5]'
numbers = [1, 2, 1, 3, 4, 5]
numbers.delete(1)
p numbers

# --- Q5
q.call
puts "puts (10..100).include?(42)"
puts (10..100).include?(42)
puts
puts "puts (10..100).cover?(42)"
puts (10..100).cover?(42)
puts
puts 'Both work in this instance. cover? checks whether the range would cover. include?() actually checks'

# --- Q6
q.call
famous_words = 'seven years ago...'

puts 'Four score and ' + famous_words
puts famous_words.prepend('Four score and ')

# --- Q7
q.call
puts '"number"'

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep

p eval(how_deep)

puts 'i see that we added 8 five times to the original number 2...but i have no idea how it works'

# --- Q8
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBan", "Pebbles"]

flintstones.flatten!

p flintstones
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

puts 'Method 1: select the key value pair, then convert to array'
array = flintstones.select { |k, v| k == "Barney" }
array = array.to_a.flatten
p array

puts 'Method 2: use assoc()'
array2 = flintstones.assoc "Barney"
p array2