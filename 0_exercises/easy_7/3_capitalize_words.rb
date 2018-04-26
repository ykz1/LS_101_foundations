# 3_capitalize_words.rb
# Start     - 12:09PM
# Finish 1  - 12:13PM
# Finish 2  - 12:20PM
# ARgument: string
# output: new string
# transformation: lowercase all and capitalize first word
# 1. convert string to array of words
# 2. iterate through array of words and for each, lowercase + capitalize
# 3. output array as joined string

def word_cap(str)
  str.split.each_with_object([]) { |word, arr| arr << my_capitalize(word) }.join(' ')
end

def word_cap2(str)
  str.split.map(&:capitalize).join(' ')
end

def my_capitalize(str)
  str = str.downcase
  str = str.chars
  str[0].upcase!
  str.join
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

puts

p word_cap2('four score and seven') == 'Four Score And Seven'
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
