
a = [0.123, -0.123, 1234.1234, -1234.1234, 0, 0.0]
a.each do |f| 
  puts "$#{format('%.2f', f)}" 
  puts "$#{format('%1.2f', f)}" 
  puts "$#{format('%2.2f', f)}" 
  puts "$#{format('%02.2f', f)}" 
  puts "$#{format('%02.1f', f)}" 
  puts "$#{format('%02.0f', f)}" 
  puts "$#{format('%02f', f)}" 
end