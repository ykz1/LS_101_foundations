def divisible_by_3_or_5 
  Proc.new do |int|
    int % 3 == 0 || int % 5 == 0
  end
end

def multisum2(int)
  (1..int).select(&divisible_by_3_or_5).inject(:+)
end

p multisum2(3) #== 3
p multisum2(5) #== 8
p multisum2(10)# == 33
p multisum2(1000)# == 234168