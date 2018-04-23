puts "Who ya askin' fer?"
input = gets.chomp.to_s.strip
name = input == '' ? "Teddy" : input
puts "#{name} is #{rand(20..200)} years old!"