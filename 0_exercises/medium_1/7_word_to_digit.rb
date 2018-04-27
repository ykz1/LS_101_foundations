# 7_word_to_digit.rb

# Start     12:03 PM
# End       12:24 PM

# Argument: string
# Return: new string
# Action: iterate through string, convert numerical words to numbers

NUMBER_WORDS = %w[zero one two three four five six seven eight nine ten]

def word_to_digit2(str)
  NUMBER_WORDS.each_with_index do |word, idx|
    str.gsub!(/\b*#{word}\s*/i, idx.to_s)
  end
  str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
  str
end

def word_to_digit(str)
  str = str.gsub(/(\W)/i,' \1')
  arr = str.split
  arr = arr.map do |word|
    NUMBER_WORDS.include?(word) ? NUMBER_WORDS.index(word) : word
  end
  arr.join(' ').gsub(/ (\W)/i,'\1')

end


p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
p word_to_digit2('Please call me at Five fIVE FIVE one two three four eight one three. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'