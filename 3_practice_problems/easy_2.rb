megacounter = 1

q = lambda do
  puts
  puts "--- Q#{megacounter}"
  megacounter += 1
end


# --- Q1
q.call

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

%w(Spot Lily).each do |str|
  puts ages.include?(str)
  puts ages.key?(str)
  puts ages.member?(str)
end

# --- Q2
q.call

munsters_description = "The Munsters are creepy in a good way."
md = munsters_description

puts md.capitalize
puts md.swapcase
puts md.downcase
puts md.upcase

# --- Q3
q.call

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)
p ages

# --- Q4
q.call
advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.include?("Dino")
puts advice.include?("dino")
puts advice.split.include?("Dino")
puts advice.match?("Dino")
puts advice.match("dino")

# --- Q5
q.call
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
p flintstones
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones

# --- Q6
q.call
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones
flintstones.push("Dino")
p flintstones

# --- Q7
q.call
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones = flintstones + %(Dino Hoppy).split
p flintstones
puts
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
flintstones.concat(%w(Dino Hoppy))
p flintstones
puts
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones
(flintstones << %w(Dino Hoppy)).flatten!
p flintstones

# --- Q8
q.call
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice!(0, advice.index('house'))
p advice
puts
advice = "Few things in life are as important as house training your pet dinosaur."
p advice.slice(0, advice.index('house'))
p advice

# --- Q9
q.call
statement = 'The Flintstones Rock!'
puts statement.length - statement.delete('t').length
puts statement.count('t')

# --- Q10
q.call
title = "Flintstone Family Members"
puts title.center(40)
