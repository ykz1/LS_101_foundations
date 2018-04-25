# 1. Confirm whether Harshad
#    a. find sum of digits
#    b. find whether sum of digits is divisible by origial number
# 2. Confirm whether digit sum * reversed digit sum = original number
#    a. find sum of digits
#    b. find reverse of sum of digits
#    c. find whether product of above == original number
def sum_of_digits(int)
  int.digits.reverse.inject(:+)
end
def reverse_digits(int)
  int.digits.inject(0) { |sum, num| sum = sum * 10 + num }
end

def is_harshad?(int)
  sum = sum_of_digits(int)
  int % sum == 0
end

def number_joy?(int)
  sum_digits = sum_of_digits(int)
  sum_digits_reversed = reverse_digits(sum_digits)
  sum_digits * sum_digits_reversed == int
end


p number_joy?(1997)  == false
p number_joy?(1998)  == false
p number_joy?(1729)  == true
p number_joy?(18)    == false
p number_joy?(81)    == true
p number_joy?(1458)  == true