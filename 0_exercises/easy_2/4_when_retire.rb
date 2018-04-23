print "What is your age? "
age = gets.chomp.to_i

print "What age do you want to retire at? "
retire_age = gets.chomp.to_i

puts

current_year = Time.now.year
years_left = retire_age - age
retire_year = current_year + years_left

puts "It's #{current_year}, you will retire in #{retire_year}"
puts "You only have #{years_left} years o go!"