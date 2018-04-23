print "What is the bill? "
bill = gets.chomp.to_f.round(2)

print "What is the tip percentage? "
tip_percent = gets.chomp.to_f / 100
tip_amount = bill * tip_percent
bill += tip_amount

puts
puts "The tip is $#{format("%.2f", tip_amount)}"
puts "Your bill total is $#{format("%.2f", bill)}"