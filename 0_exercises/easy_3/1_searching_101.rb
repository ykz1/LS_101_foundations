def get_numbers
  input = ''
  loop do
    input = gets.chomp
    break if input.to_i.to_s == input
    puts "Enter a valid integer"
  end
  input.to_i
end

numbers = (1..6).map do |num|
  print "=> Enter number #{num}: "
  get_numbers
end

first_few = numbers.select.with_index { |_, index| index != numbers.size - 1 }

if first_few.include?(numbers[-1])
  puts "The number #{numbers[-1]} appears in #{first_few}"
else
  puts "The number #{numbers[-1]} does not appear in #{first_few}"
end
