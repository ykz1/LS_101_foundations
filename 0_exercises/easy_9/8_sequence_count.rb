# 8_sequence_count.rb

# Start     4:54 PM
# End       4:56 PM

def sequence(int1, int2)
  (1..int1).map { |int| int * int2 }
end

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []