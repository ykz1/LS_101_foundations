# 4_swap_case.rb
# Start:    12:23PM
# Finish:   12:27PM


# Argument: string
# Return: new string
# Transformation: switch the case of all alpha chars

def swapcase(str)
  str.chars.map { |char| char == char.upcase ? char.downcase : char.upcase }.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

