print "What is your name? "
username = gets.chomp

if username[username.length - 1] == '!'
  puts "HELLO #{username.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{username.capitalize}"
end


