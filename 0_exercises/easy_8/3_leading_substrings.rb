# 3_leading_substrings.rb
# Start:    2:59PM
# Finish:   3:05PM
# Extras:   3:08PM


# Arguments: string
# Return: new array

# Action: 
#   1. Iterate through chars in string and append to arr all the strings up to that char
#   2. return arr

def substrings_at_start(str)
  str.chars.map.with_index { |_, idx| str.slice(0..idx) }
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']