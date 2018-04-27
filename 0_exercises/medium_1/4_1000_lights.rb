# 4_1000_lights.rb

# Start     10:45 AM
# End       10:59 PM

# Argument: one integer (n)
# Return: an array
# Steps:
#   1. there are (n) number of switches - this is the number of elements to return in our array
#   2. go through (n) rounds of flipping switches
#   3. on each round, flip every (i)th, with (i) being the iteration we're on
#   4. select the lights that are on and return this final array of on lightbulbs

# 1: 11111
# 2: 1-1-1
# 3: 1---1
# 4: 1--11
# 5: 1--1-

def lights(int)
  arr = []
  int.times { arr << true }
  (2..int).each do |round|
    (round..int).step(round) do |idx|
      idx -= 1
      arr[idx] = !arr[idx]
    end
  end
  arr = arr.map.with_index { |ele, idx| ele ? idx + 1 : nil }
  arr.select { |ele| ele }
end




p lights(5)   == [1, 4]
p lights(10)  == [1, 4, 9]
p lights(1000)  == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]