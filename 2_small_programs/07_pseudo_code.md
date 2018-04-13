-----# 1. a method that returns the sum of two integers

START

SET method with two inputs

SET sum = input1 + input2

RETURN sum

END

----# 2. a method that takes an array of strings, and returns a string that is all those strings concatenated together

START

SET method with one input (an array)

SET counter = 0
SET result

WHILE counter <= input's size
  result = result + input's counter'th value
  counter = counter + 1

RETURN result

END

-----# 3. a method that takes an array of integers, and returns a new array with every other element

START

SET method with one input

SET n = 0
SET result as an empty array

WHILE n <= input array's size
  ADD input array's n'th value to end of result
  n = n + 2

RETURN result

END
