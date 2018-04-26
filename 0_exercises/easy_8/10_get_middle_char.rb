# 10_get_middle_char.rb

# Start     4:05 PM
# End       4:10 PM

# Argument: string
# return: new string
# Steps:
#   1. find the middle: divide size by 2
#   2. check if odd or even, if odd take one, if even take two
#   3. return result

def center_of(str)
  len = str.length
  mid = len / 2
  len.odd? ? str[mid] : str[mid - 1] + str[mid]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'