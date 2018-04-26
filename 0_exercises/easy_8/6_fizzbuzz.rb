# 6_fizzbuzz.rb
# Start     3:32PM
# Finish    3:44PM


# ARguments: 2 integers
# Output some things
# Steps
#   1. iterate through the range between the integers given
#   2. if 3 print Fizz, if 5, print Buzz, if 3 and 5, print both

def fizzbuzz(int1, int2)
  arr = (int1..int2).inject([]) do |arr, int|
    output = ''
    output += 'Fizz' if int % 3 == 0
    output += 'Buzz' if int % 5 == 0
    output = int if output == ''
    arr << output
  end
  puts arr.join(', ')
end


fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz