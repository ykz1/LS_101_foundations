megacounter = 1

q = lambda do
  puts "----"
  puts "Q#{megacounter}"
  megacounter += 1
end

# --- Q1
q.call

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

a = {}
flintstones.each_with_index do |value, index|
  a[value] = index
end
p a

# --- Q2
q.call

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum_ages = 0
ages.values.each { |age| sum_ages += age }
p sum_ages
# alt
sum_ages2 = 0
ages.each { |_, age| sum_ages2 += age }
p sum_ages2
# alt 2 from answer. inject performs an action on all objects and ":+" adds them
p ages.values.inject(:+)

# --- Q3
q.call

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

p ages.reject { |_, age| age >= 100 }
p ages
p ages.select { |_, age| age < 100 }
p ages
p "above are not destructive, to mutate, use keep_if"
p ages.keep_if { |_, age| age < 100 }
p ages

# --- Q4
q.call

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p 'returns the person and age'
p ages.min
p 'returns just the age'
p ages.min[1]
p ages.values.min

# --- Q5
q.call

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index { |name, index| p index if name.start_with?('Be') }
p flintstones.index { |name| name.start_with?('Be') }

# --- Q6
q.call

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
p flintstones

# --- Q7
q.call

statement = "The Flintstones Rock"
hsh = {}
statement.each_char do |char|
  if hsh.has_key?(char)
    hsh[char] += 1
  else
    hsh[char] = 1
  end
end
p hsh

a = statement.chars.each_with_object({}) do |char, hsh|
  if hsh.has_key?(char)
    hsh[char] += 1
  else
    hsh[char] = 1
  end
end
p a

result= {}
letters = ('a'..'z').to_a + ('A'..'Z').to_a

letters.each do |char|
  count = statement.count(char)
  result[char] = count if count > 0
end
p result

# --- Q8
q.call
puts "it iterates through the index so..."
puts "1 gets printed, then as numbers[0], it gets removed"
puts "3 gets printed, then 2, as the new numbers[0], gets removed"
puts "and that's it, numbers becomes [3, 4]"

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
p numbers

puts
puts "1 gets printed, and '4' gets removed"
puts "2 gets printed, and '3' gets removed"
puts "each finishes, numbers becomes [1, 2]"

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
p numbers

# --- Q9
q.call

words = "the flintstones rock"

p words.split.each_with_object([]) {|word, arr| arr << word.capitalize }.join(" ")
p words.split.map {|word| word.capitalize }.join(' ')

# --- Q10
q.call

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |key, traits|
  munsters[key]["age_group"] =  case munsters[key]["age"]
                                when 0..17
                                  'kid'
                                when 18..64
                                  'adult'
                                else
                                  'senior'
                                end
end
p munsters

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, traits|
  traits["age_group"] = case traits["age"]
                        when 0..17 then 'kid'
                        when 18..64 then 'adult'
                        else 'senior'
                        end
end
p munsters