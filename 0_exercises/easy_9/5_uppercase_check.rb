# 5_uppercase_check.rb

# Start     4:45 PM
# End       4:48 PM
# Bonus     4:

def uppercase?(str)
  !(str =~ /[a-z]/)
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true