# 5_staggered_caps_1.rb
# Start     12:31PM
# Finish    12:37PM
# Extras    12:46PM
# ARgument: string
# Return: new string
# Transformation: upcase every other char, downcase rest

def staggered_case(str)
  str.chars.map.with_index { |char, idx| idx.even? ? char.upcase : char.downcase }.join
end

def staggered_case2(str)
  str[0] == str[0].downcase ? toggle = 1 : toggle = 0
  str.chars.map.with_index { |char, idx| idx % 2 == toggle ? char.upcase : char.downcase }.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

puts

p staggered_case2('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS') == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 NuMbErS'