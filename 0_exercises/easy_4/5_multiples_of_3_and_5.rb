def divisible_by_3_or_5(int)
  int % 3 == 0 || int % 5 == 0
end
def multisum(int)
  (1..int).select { |num| divisible_by_3_or_5(num) }.inject(:+)
end


def divisible_by_3_or_5_alt
  Proc.new do |num|
    num % 3 == 0 || num % 5 == 0
  end
end

def multisum2(int)
  (1..int).select(&divisible_by_3_or_5_alt).inject(:+)
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168

puts 

p multisum2(3) == 3
p multisum2(5) == 8
p multisum2(10) == 33
p multisum2(1000) == 234168