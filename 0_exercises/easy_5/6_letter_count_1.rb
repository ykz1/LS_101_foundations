def word_sizes(str)
  hsh = {}
  str.split.each do |word|
    length = word.length
    if hsh.has_key?(length)
      hsh[length] += 1
    else
      hsh[length] = 1
    end
  end
  hsh
end

def word_sizes2(str)
  hsh = Hash.new(0)
  str.split.each do |word|
    hsh[word.length] += 1
  end
  hsh
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

puts

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes2("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes2('') == {}