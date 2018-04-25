NUMBER_WORDS = %w[zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]


def alphabetic_number_sort(arr)
  arr.sort_by { |int| NUMBER_WORDS[int] }
end

def alphabetic_number_sort2(arr)
  arr2 = arr.map { |int| NUMBER_WORDS[int] }
  arr2.sort!
  arr2.map { |word| NUMBER_WORDS.index(word) }
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

p alphabetic_number_sort2((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

