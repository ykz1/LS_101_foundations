# 2_double_doubles.rb

# Start     4:20 PM
# End       4:31 PM

# Argument: int
# Return: another int
# Steps:
#   1. Method 1: check whether double number
#       1. has to be even digits
#       2. left half == right half
#   2. If so, output number, otherwise output double that number

def double_num?(int)
  # digits is even && left half = right half
  len = int.to_s.length
  arr = int.digits.reverse
  len.even? && arr.take(len / 2) == arr.drop(len / 2)
end

def twice(int)
  double_num?(int) ? int : int * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10