def string_to_signed_integer(str)
  output = str.chars.inject(0) { |sum, char| sum = sum * 10 + ('1'..char).count }
  str[0] == '-' ? -output : output
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100