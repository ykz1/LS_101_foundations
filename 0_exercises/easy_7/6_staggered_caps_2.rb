# 6_staggered_caps_2.rb
# Start       12:46PM
# Finish      12:57PM
# Extras      01:07PM
#          should we           |  char   |    char
#           toggle?            |is alpha | is not alpha
# -----------------------------+---------+------------
# ignore non-alpha toggle on   |   yes   |     no
# ignore non-alpha toggle off  |   yes   |     yes

def staggered_case(str)
  cap_toggle = true
  str.chars.each_with_object('') do |char, output|
    if char =~ /[a-zA-Z]/
      output << (cap_toggle ? char.upcase : char.downcase)
      cap_toggle = !cap_toggle
    else
      output << char
    end
  end
end

def staggered_case2(str, ignore_non_alphas = true)
  cap_toggle = true
  str.chars.each_with_object('') do |char, output|
    if char =~ /[a-zA-Z]/
      output << (cap_toggle ? char.upcase : char.downcase)
      cap_toggle = !cap_toggle
    else
      output << char
      cap_toggle = !cap_toggle if !ignore_non_alphas
    end
  end
end

def staggered_case3(str, ignore_non_alphas = true, cap_toggle = true)
  str.chars.each_with_object('') do |char, output|
    output << (cap_toggle ? char.upcase : char.downcase)
    cap_toggle = !cap_toggle unless (char =~ /[^a-zA-Z]/ && ignore_non_alphas)
  end
end



p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

puts

p staggered_case2('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case2('ALL CAPS') == 'AlL cApS'
p staggered_case2('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case2('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case2('ALL_CAPS', false) == 'AlL_CaPs'
p staggered_case2('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'

puts

p staggered_case3('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case3('ALL CAPS') == 'AlL cApS'
p staggered_case3('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case3('I Love Launch School!', false) == 'I LoVe lAuNcH ScHoOl!'
p staggered_case3('ALL_CAPS', false) == 'AlL_CaPs'
p staggered_case3('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 NuMbErS'

puts

p staggered_case3('I Love Launch School!', true, false) #== 'I lOvE lAuNcH sChOoL!'
p staggered_case3('ALL CAPS', true, false) #== 'AlL cApS'
p staggered_case3('ignore 77 the 444 numbers', true, false) #== 'IgNoRe 77 ThE 444 nUmBeRs'

p staggered_case3('I Love Launch School!', false, false) #== 'I LoVe lAuNcH ScHoOl!'
p staggered_case3('ALL_CAPS', false, false) #== 'AlL_CaPs'
p staggered_case3('ignore 77 the 444 numbers', false, false) #== 'IgNoRe 77 ThE 444 NuMbErS'