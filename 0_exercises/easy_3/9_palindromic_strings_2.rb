def palindrome?(obj)
  obj == obj.reverse
end

def real_palindrome?(str)
  alphanumerics = ('a'..'z').to_a + (0..9).to_a
  arr = str.chars.map(&:downcase).select { |char| alphanumerics.include?(char) }
  palindrome?(arr)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
puts

def real_palindrome2?(str)
  str = str.downcase.delete('^a-z0-9')
  palindrome?(str)
end

p real_palindrome2?('madam') == true
p real_palindrome2?('Madam') == true           # (case does not matter)
p real_palindrome2?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome2?('356653') == true
p real_palindrome2?('356a653') == true
p real_palindrome2?('123ab321') == false
puts

def real_palindrome3?(str)
  str = str.downcase.gsub(/\W/, '')
  palindrome?(str)
end

p real_palindrome3?('madam') == true
p real_palindrome3?('Madam') == true           # (case does not matter)
p real_palindrome3?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome3?('356653') == true
p real_palindrome3?('356a653') == true
p real_palindrome3?('123ab321') == false