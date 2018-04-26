# 9_grade_book.rb

# Start   4:57 PM
# End     5:04 PM

def get_grade(int1, int2, int3)
  avg = (int1 + int2 + int3) / 3.0
  avg = avg.round

  case avg
    when (90..100) then 'A'
    when (80...90) then 'B'
    when (70...80) then 'C'
    when (60...70) then 'D'
    else 'F'
  end

end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"