print "Write something: "
input = gets.chomp

input_length = input.delete(' ').length

puts "There are #{input_length} characters in \"#{input}\""