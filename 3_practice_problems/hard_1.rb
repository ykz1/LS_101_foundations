megacounter = 1

q = lambda do
  puts
  puts "--- Q#{megacounter}"
  megacounter += 1
end

# --- Q1
q.call

puts "undefined variable / method error"
puts "[try2] nothing"
if false
  greeting = “hello world”
end

greeting

# --- Q2
q.call

puts "':a', 'hi'"
puts "[try2] {:a => 'hi there'}, because informal_greetings points to the same value as greetings[:a], and << is mutating"

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# --- Q3
q.call

puts "no change. the variables being re-assigned in mess_with_vars are local"

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts
puts "---"
puts 'still no change. still re-assigning local variables'

def mess_with_vars2(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars2(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

puts
puts "---"
puts 'changed now because gsub! is mutating'

def mess_with_vars3(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars3(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"

# --- Q4
q.call

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

def kyle(str)
  dot_separated = str.split(".")
  return false if dot_separated.size != 4
  while dot_separated.size > 0 do
    word = dot_separated.pop
    return false if !is_an_ip_number?(word)
  end
  true
end
