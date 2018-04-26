# 7_double_char_1.rb

# Start     3:46PM
# Finish    3:49PM
# Bonus     3:

# ARgument: take a string
# return: a new string
# action: 
#   alt 1: iterate through chars of string and double it into new string
#   alt 2: gsub with regex

def repeater(str)
  str.gsub(/(.)/, '\1\1')
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''