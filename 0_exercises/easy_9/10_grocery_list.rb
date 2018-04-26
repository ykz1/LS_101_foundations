# 10_grocery_list.rb

# Start     5:06 PM
# End       5:09 PM

def buy_fruit(arr)
  arr.each_with_object([]) { |sbry, output| sbry[1].times { output << sbry[0] } }
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]


