def palindromic_number?(int)
  int.to_s == int.to_s.reverse
end


p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

def palindromic_number_v2?(input)
  input = '0%o' % input
  input.to_s == input.to_s.reverse
end

p palindromic_number_v2?(0500)