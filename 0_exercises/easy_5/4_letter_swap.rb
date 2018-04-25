def swap(str)
  arr = str.split.map do |word|
    if word.length == 1
      word
    else
      mid = word.chars
      mid.pop
      mid.shift
      word[-1] + mid.join + word[0]
    end
  end
  arr.join(' ')
end

def swap2(str)
  arr = str.split.map do |word|
    inverse_word = word.reverse
    if word != inverse_word
      word[0] = inverse_word[0]
      word[-1] = inverse_word[-1]
    end
    word
  end
  arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

puts

p swap2('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap2('Abcde') == 'ebcdA'
p swap2('a') == 'a'