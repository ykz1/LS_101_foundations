def reverse_sentence(str)
  str.split.reverse.join(" ")
end

def reverse_sentence2(str)
  return '' if str == ''

  temp_str = ''
  arr = []
  counter = 0
  counter2 = 0

  loop do
    if str[counter] == ' '
      arr[counter2] = temp_str
      temp_str = ''
      counter2 += 1
    elsif counter == str.length - 1
      temp_str += str[counter]
      arr[counter2 ] = temp_str
      break
    else
      temp_str += str[counter]
    end
    counter += 1
  end

  output = ''
  counter = arr.size - 1
  loop do
    output += arr[counter]
    break if counter <= 0
    output += ' '
    counter -= 1
  end
  output
end

def reverse_sentence3(str)
  return '' if str == ''

  counter = str.length - 1
  output = ''
  temp_str = ''

  loop do
    if str[counter] == ' '
      output += temp_str
      output += ' '
      temp_str = ''
    elsif counter == 0
      temp_str = str[counter] + temp_str
      output += temp_str
      break
    else
      temp_str = str[counter] + temp_str
    end
    counter -= 1
  end
  output
end



puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

puts

puts reverse_sentence2('') == ''
puts reverse_sentence2('Hello World') == 'World Hello'
puts reverse_sentence2('Reverse these words') == 'words these Reverse'

puts

puts reverse_sentence3('') == ''
puts reverse_sentence3('Hello World') == 'World Hello'
puts reverse_sentence3('Reverse these words') == 'words these Reverse'
