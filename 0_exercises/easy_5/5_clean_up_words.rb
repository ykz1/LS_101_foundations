ALPHAS = ('A'..'Z').to_a + ('a'..'z').to_a

def cleanup(str)
  str.gsub!(/[^a-zA-Z]+/, ' ')
end

def cleanup2(str)
  arr = str.chars.map do |char|
    ALPHAS.include?(char) ? char : ' '
  end
  arr.join.squeeze(' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
p cleanup2("---what's my +*& line?") == ' what s my line '