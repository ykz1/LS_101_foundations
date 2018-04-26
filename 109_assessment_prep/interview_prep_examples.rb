
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