def signed_integer_to_string_2(int)
  if int == 0
    prefix = ''
  elsif int < 0
    prefix = '-'
    int = -int
  else
    prefix = '+'
  end
  prefix + int.digits.reverse.join
end

def signed_integer_to_string(int)
  int.abs.digits.reverse.join.prepend case int <=> 0
                                      when -1 then '-'
                                      when +1 then '+'
                                      else ''
                                      end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

puts

p signed_integer_to_string_2(4321) == '+4321'
p signed_integer_to_string_2(-123) == '-123'
p signed_integer_to_string_2(0) == '0'