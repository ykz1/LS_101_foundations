def crunch(str)
  arr_crunched = []
  str.chars.each do |char|
    arr_crunched << char if char != arr_crunched.last
  end
  arr_crunched.join
end

def crunch2(str)
  str.chars.each_with_object([]) { |chr, arr| arr << chr if chr != arr.last }.join
end

def crunch3(str)
  str.gsub(/(?<char>\w)\k<char>+/, '\k<char>')
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''

puts

p crunch2('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch2('4444abcabccba') == '4abcabcba'
p crunch2('ggggggggggggggg') == 'g'
p crunch2('a') == 'a'
p crunch2('') == ''

puts

p crunch3('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch3('4444abcabccba') == '4abcabcba'
p crunch3('ggggggggggggggg') == 'g'
p crunch3('a') == 'a'
p crunch3('') == ''