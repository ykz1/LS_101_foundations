

# If we list all the natural numbers below 10 that are multiples of 3 or 5,
#  we get 3, 5, 6 and 9. The sum of these multiples is 23.

# Finish the solution so that it returns the sum of all the multiples
# of 3 or 5 below the number passed in.

# Note: If the number is a multiple of both 3 and 5, only count it once.

# Problem

puts "--------"

require "pry"
def sum_of_multiples(int)
  arr = (1...int).select do |num|
    num % 3 == 0 || num % 5 == 0
  end
  arr.inject(:+)
end

p sum_of_multiples(10) == 23
p sum_of_multiples(20) == 78
p sum_of_multiples(200) == 9168


# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there articletwo same numbers
#   then that number can be used 2 times.
# =end




#   *******************NUMBER 1**************************

# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there articletwo same numbers
#   then that number can be used 2 times.

=begin
1. Form all possible subsets of 3
    example:  [1, 2, 3, 4, 5]
    -------------------------
    pair 1:   [1, 2, 3      ]
    pair 2:   [1, 2,    4   ]
    pair 3:   [1, 2,       5]
    pair 4:   [1,    3, 4   ]
    pair 5:   [1,    3,    5]
   We want to run 3 loops to iterate through all the possible numbers for each of our 3 numbers to be included in subsets
2. For each, check whether their product is equal to the maximum element within the array, if this proves true, stop method and return true
3. If we go through all subsets without 2. evaluating true, return false
=end
puts "--------"

def mult_of_three_nums(arr)
  size = arr.size
  (1..size).each do |idx1|
    ((idx1 + 1)..size).each do |idx2|
      ((idx2 + 1)..size).each do |idx3|
        # binding.pry
        product = arr[idx1 - 1] * arr[idx2 - 1] * arr[idx3 - 1]
        return true if product == arr.max
      end
    end
  end
  false
end

p mult_of_three_nums([1,2,3,4,5,6]) == true
p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false



# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

# *****************NUMBER 2****************************

# Given a string, find the number character that is repeated most times and return it's numeric value. If multiple characters are repeated the same time, return first one.
# If there are no numeric characters in a string return nil.
# =end
puts "--------"

def re_letter2(str)
  return nil unless str =~ /\d/
  arr = (1..9).map do |num|
    str.count(num.to_s)
  end
  arr.each_with_index do |count, idx|
    return idx + 1 if count == arr.max
  end
end

def re_letter(str)
  return nil unless str =~ /\d/
  arr = (1..9).map do |num|
    str.count(num.to_s)
  end
  str.chars.each do |char|
    return char.to_i if str.count(char) == arr.max
  end
end

p re_letter('There isn\' any number here!') == nil
p re_letter('%^&*()!') == nil
p re_letter('111222333') == 1
p re_letter('1234335521444') == 4
p re_letter('') == nil
p re_letter('011-555-333-23') == 3 
p re_letter('1') == 1 
p re_letter('444352893599119') == 9
p re_letter('333222111') == 3
p re_letter('332221113') == 3
p re_letter('221113332') == 2




# *****************NUMBER 3****************************

# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
#  We only care about substrings that are longer than one letter long.

puts "--------"
def substring_test(str1, str2)
  arr1 = []
  len1 = str1.size
  (2..len1).each do |len|
    (0..(len1 - 2)).each do |idx|
      arr1 << str1[idx..(idx + len - 1)].downcase
    end
  end
  len2 = str2.size
  (2..len2).each do |len|
    (0..(len2 - 2)).each do |idx|
      substring = str2[idx..(idx + len - 1)].downcase
      return true if arr1.include?(substring)
    end
  end
  false
end



p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', 'Fun') == false
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true


# *****************NUMBER 4****************************

# Write a function to_weird_case (weirdcase in Ruby) that accepts a string, and returns the same string
# with every 4th character in a word upcase. Other characters should remain the same.
puts "-----------"
def to_weird_case(str)
  arr = str.split
  arr.each do |word|
    (3...word.length).step(4) do |i|
      word[i] = word[i].upcase
    end
  end
  arr.join(' ')
end

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'LorEm IpsUm is simPly dumMy texT of the priNtinG'
p to_weird_case('It is a long established fact that a reader will be distracted') == 'It is a lonG estAbliShed facT thaT a reaDer wilL be disTracTed'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case('Merry Poppins word is supercalifragilisticexpialidocious') == 'MerRy PopPins worD is supErcaLifrAgilIstiCexpIaliDociOus'