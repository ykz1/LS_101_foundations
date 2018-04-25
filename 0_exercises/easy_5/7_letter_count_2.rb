def word_sizes(str)
  hsh = Hash.new(0)
  str.split.each do |word|
    hsh[word.downcase.count "a-z"] += 1
  end
  hsh
end

def word_sizes2(str)
  str.split.each_with_object(Hash.new(0)) { |wrd, hsh| hsh[wrd.count 'a-zA-Z'] += 1 }
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}

puts

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}