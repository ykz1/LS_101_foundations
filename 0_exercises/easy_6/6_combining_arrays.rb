#6_combining_arrays.rb
def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

def merge2(arr1, arr2)
  arr = []
  arr1.each { |ele| arr << ele if !arr.include?(ele) }
  arr2.each { |ele| arr << ele if !arr.include?(ele) }
  arr
end

def merge3(arr1, arr2)
  arr1 | arr2 # union merges both arrays and takes only uniques. interesting...
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

p merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

p merge3([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]