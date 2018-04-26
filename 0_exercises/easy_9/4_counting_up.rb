# 4_counting_up.rb

# Start     4:34 PM
# End       4:45 PM

def sequence(int)
  (1..int.abs).map { |i| i * int / int.abs }.sort
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

p sequence(-6)
p sequence(-2)