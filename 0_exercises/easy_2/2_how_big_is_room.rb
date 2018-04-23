SQFT_PER_SQM = 10.7639
FT_PER_M = 3.238084

puts "Enter the length in meters"
length_m = gets.chomp.to_f

puts "Enter the width in meters"
width_m = gets.chomp.to_f

area_m = length_m * width_m
area_ft = area_m * SQFT_PER_SQM

puts "Room is #{format("%.2f", area_m)} square meters (#{format("%.2f", area_ft)} square feet)"

# Further exploration
puts
puts "Enter length in ft"
length_ft = gets.chomp.to_f
puts "Enter width in ft"
width_ft = gets.chomp.to_f

area_ft = length_ft * width_ft
area_m = area_ft / SQFT_PER_SQM
area_cm = area_m * 100**2

puts "Your room is..."
puts "#{format("%.2f", area_ft)} square feet"
puts "#{format("%.2f", area_m)} square meter"
puts "#{format("%.2f", area_cm)} square centimeter"


