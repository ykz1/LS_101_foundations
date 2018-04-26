# 8_double_char_2.rb

# Start     3:50PM
# End       3:55PM
# Bonus     4:01PM

# argument: string
# return: new string
# steps
#     alt 1: iterate through chars of string, for consonants, append 2 into new string, else append 1
#     alt 2: regex: replace consonants with 2 of themselves


def double_consonants(str)
  str.gsub(/([a-z&&[^aeiou]])/i,'\1\1')
end

# def double_consonants(str)
#   str.chars.map.with_index do |char, indx| 
#     (char =~ /[a-z&&[^aeiou]]/i) ? char * 2 : char 
#   end.join
# end

p double_consonants('StrIng') == "SSttrrInngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""