# 4_all_substrings.rb
# Start   3:08PM
# Finish  3:13PM
# Extras  3:

# ARgument: string
# Return: array of strings
# Action:
#   1. iterate through each character starting at first
#   2. iterate through each character starting at second
#   3. ...
#   For each inner iteration, we want to find all the strings that start with it

def substrings_at_start(str)
  str.chars.map.with_index { |_, idx| str.slice(0..idx) }
end

def substrings(str)
  str.chars.map.with_index { |_, idx| substrings_at_start(str[idx..str.length - 1]) }.flatten
end

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]