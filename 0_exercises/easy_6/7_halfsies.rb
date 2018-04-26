# 7_halfsies.rb
def halvsies(arr)
  arr2 = []
  until arr2.size >= arr.size
    arr2 << arr.shift
  end
  [arr2, arr]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]