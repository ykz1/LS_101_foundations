# 5_palindromic_substrings.rb
# Start     3:15PM
# End       3:29PM
#

# Argument: string
# Return: array of sub-strings
# Action: 
#   1. break up string into its component words
#   2. iterate through words and determine whether each is a palindrome (another method) OR contain an inner palindrome
#   3. if palindrome, add to output array
#   4. return resulting array
# Notes:
#   don't remove duplicates from returning array
#   case sensitive

def substrings_at_start(str)
  str.chars.map.with_index { |_, idx| str.slice(0..idx) }
end

def substrings(str)
  str.chars.map.with_index { |_, idx| substrings_at_start(str[idx..str.length - 1]) }.flatten
end

def palindrome?(str)
  str == str.reverse
end

def palindromes(str)
  str.split.inject([]) do |output, word|
    output + substrings(word).select { |str| str.length > 1 && palindrome?(str) }
  end
end

# def palindromes(str)
#   substrings(str).select { |substr| substr.size > 1 && substr.reverse == substr }
# end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]