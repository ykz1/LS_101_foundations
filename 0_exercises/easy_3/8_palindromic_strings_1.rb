def palindrome?(obj)
  obj == obj.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?(['one', 'two', 'three']) == false
p palindrome?(['one', 'two', 'one']) == true

# Further exploration: above works for strings and arrays