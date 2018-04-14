
a = [0, 0.1, 1234.123]

a.each do |f|
  puts "$#{format('%.2f', f)}"
  puts "$#{format('%03.2f', f)}"
  puts "$#{format('%03.f', f)}"
  puts "$#{format('%03f', f)}"
  puts "$#{format('%83f', f)}"
  puts "$#{format('%.5f', f)}"
end

  
  
  