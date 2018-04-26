# 10_end_is_near.rb

# Start     2:13PM
# Finish    2:16PM
# Extras    2:22PM

# ARgument: string
# Return: new string
# Action: find the second to last word in string
# Steps:
#   1. split string into an array of words
#   2. return the second last element of array

def penultimate(str)
  str.split[-2]
end

def middle_word(str)
  arr = str.split
  size = arr.size.to_f / 2
  if size.to_i != size
    arr[size.to_i]
  else
    [arr[size.to_i - 1], arr[size.to_i]].join(' ')
  end
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

p middle_word('last word') #== 'last'
p middle_word('Launch School is great!') #== 'is'
p middle_word('here is an odd sentence')