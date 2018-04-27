require "pry"

# def balancer(str)
#   counter = 0
#   str.chars.each do |char|
#     counter += 1 if char == "("
#     if char == ")"
#       counter = [counter - 1, 0].max
#     end
#   end
#   counter == 0
# end



# p balancer("hi") #== true
# p balancer("(hi") #== false
# p balancer("(hi)") #== true
# p balancer(")hi(") #== false
# p balancer("((hi)") #== false

# p balancer("(h(i)))")

# ------------------------
puts "-------------------"
def is_prime?(int)
  !(2..(int/2)).any? { |divisor| int % divisor == 0 }
end

# p is_prime?(4)
# p is_prime?(5)


def find_primes(int1, int2)
  (int1..int2).select do |int|
    is_prime?(int)
  end
end

p find_primes(3, 99)
p find_primes(1, 2)

# -------------------------
puts "-------------------"
# take string argument
# return new string
def return_collapsed(str)
  arr = []
  str.chars.each do |char|
    if char == arr.last
      next
    else
      arr << char
    end
  end
  arr.join
end

def return_collapsed2(str)
  str.gsub(/(.)\1+/, '\1')
end

p return_collapsed("hello worldd")
p return_collapsed2 ("hello worldd")


# -------------------------
puts "-------------------"

# arguments: string, 2 ints
# return: string
# steps:

def substring(str, start, stop = 'start')
  stop = start if stop == 'start'
  str[start..stop]
end

p substring('honey', 0, 2) # => 'hon'
p substring('honey', 1, 2) # => 'on'
p substring('honey', 3, 9) # => 'ey'
p substring('honey', 2) # => 'n'


# -------------------------
puts "-------------------"

# arguments: string
# return: new array of all possible sub-strings, excluding 1-char substrings

# idx1: 1, 2, 3, 4
# -----------------
# idx2: 2, 3, 4
#       3, 4
#       4



# def substrings(str)
#   output = []
#   len = str.length
#   len.times do |idx1|
#     (len - 1).times do |idx2|
#       idx2 += 1
#       output << str[idx1..idx2] if idx2 > idx1
#     end
#   end
#   output
# end


# p substrings('band') # => ['ba', 'ban', 'band', 'an', 'and', 'nd']


# -------------------------
puts "-------------------"

# find largest substring that is a palindrome within a string

# x 1. find all substrings
# - 2. select ones that are palindromes
# - 3. select the one(s) with the longest string

def substrings(str)
# should return array of all substrings longer than one character
# str[idx1..idx2]
# idx1: 1, 2, 3
# idx2: 2, 3, 4
#       3, 4
#       4
  len = str.length
  arr = []
  (0..(len - 2)).each do |idx1|
    ((idx1 + 1)..(len - 1)).each do |idx2|
      arr << str[idx1..idx2]
    end
  end
  arr
end

def palindrome?(str)
  str.reverse == str
end

def longest_length(arr)
  arr.map(&:length).max
end
p longest_length(['hi', 'hello', 'goodbye'])

def largest_palindromes(str)
  arr = []
  str.split.each { |word| arr << substrings(word) }
  arr = arr.flatten
  arr = arr.select { |str| palindrome?(str) }
  arr = arr.select { |str| str.length == longest_length(arr) }
  arr
end

p substrings('band') # => ['ba', 'ban', 'band', 'an', 'and', 'nd']
p palindrome?('car')
p palindrome?('cac')

p largest_palindromes('ppop racecar mooooom')


NUMBERS = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen nineteen twenty]
OPERATORS = { '+' => 'plus',
              '-' => 'minus',
              '/' => 'dividedby',
              '*' => 'times' }
def compute(str)
  arr = str.split
  int1 = arr.first.to_i
  int2 = arr.last.to_i
  op = OPERATORS.key(arr[1])
  [int1, int2].inject(op.to_sym)
end

p compute('2 plus 2')
p compute('7 minus 6')
p compute('0 plus 8')

# 1. split to array of words
# 2. take first 3 elements, evaluate it using our computer() method
# 3. convert the integer result back into a word, and unshift that back into our original array
# 4. continue until done

# alternative approach: translate the entire string of words into integers and operators, then evaluate

# def calculate_old(str)
#   str = str.gsub('divided by', 'dividedby')
#   arr = str.split
#   loop do
#     section = arr[0..2].join(' ')
#     answer = compute(section)
#     answer = NUMBERS[answer]
#     arr[0..2] = answer
#     break if arr.size <= 1
#     # binding.pry
#   end
#   NUMBERS.index(arr[0])
# end

def words_to_num(str)
  str = str.gsub('divided by', 'dividedby')
  arr = str.split
  arr.map { |word| NUMBERS.include?(word) ? NUMBERS.index(word) : word }
end

def calculate_divide_multiply(arr)
  idx = 0
  loop do
    if arr[idx] == 'dividedby' || arr[idx] == 'times'
      arr[(idx - 1)..(idx + 1)] = compute(arr[(idx - 1)..(idx + 1)].join(' '))
    else
      idx += 1
    end
    break if idx >= arr.size - 1
  end
  arr
end

def calculate_left_to_right(arr)
  loop do 
    answer = compute(arr.take(3).join(' '))
    arr[0..2] = answer
    break if arr.size <= 1
  end
  arr
end

def calculate(str)
  arr = words_to_num(str)
  arr = calculate_divide_multiply(arr)

  return arr[0] if arr.size == 1

  arr = calculate_left_to_right(arr)

  arr[0]
end


puts

p calculate('two plus two minus three')
p calculate('three minus one plus five minus 4 plus six plus 10 minus 4')
p calculate('nine divided by three times six')

p calculate('eight times four plus six divided by two minus two')
p calculate('seven times four plus one divided by three minus two')

