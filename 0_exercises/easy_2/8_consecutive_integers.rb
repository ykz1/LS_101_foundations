puts "Enter an integer greater than 0"
int = ''
loop do
  int = gets.chomp.to_i
  break if int > 0
  puts "Enter a valid integer greater than 0 please"
end

puts "Enter 's' to compute sum, 'p' to compute product"
op = ''
loop do
  op = gets.chomp.strip
  break if %w[s p].include?(op)
  puts "Please enter either 's' or 'p'"
end

if op == 's'
  output = (1..int).inject(:+)
  puts "The sum of the integers between 1 and #{int} is #{output}"
elsif op == 'p'
  output = (1..int).inject(:*)
  puts "The product of the ingetegers between 1 and #{int} is #{output}"
end
