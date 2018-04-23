def reverse_words(str)
  arr = str.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  arr.join(' ')
end

def reverse_words2(str)
  counter = 0
  temp_str = ''
  temp_str2 = ''
  output = ''
  loop do
    if counter == str.length - 1
      temp_str = str[counter] + temp_str
      temp_str2 += str[counter]
      if temp_str.length >= 5
        output += temp_str
      else
        output += temp_str2
      end
      break
    elsif str[counter] == ' '
      if temp_str.length >= 5
        output += temp_str
      else
        output += temp_str2
      end
      output += ' '
      temp_str = ''
      temp_str2 = ''
    else
      temp_str = str[counter] + temp_str
      temp_str2 += str[counter]
    end
    counter +=1
  end
  output
end



puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

puts

puts reverse_words2('Professional')          # => lanoisseforP
puts reverse_words2('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words2('Launch School')         # => hcnuaL loohcS