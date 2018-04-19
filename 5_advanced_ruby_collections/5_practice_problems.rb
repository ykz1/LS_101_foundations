megacounter = 1

q = lambda do
  puts "----"
  puts "Q#{megacounter}"
  megacounter += 1
end

# --- Q1
q.call

arr = ['10', '11', '9', '7', '8']

arr2 = arr.sort_by do |str|
  str.to_i
end

p arr2.reverse!

arr3 = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p arr3

# --- Q2
q.call
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

books2 = books.sort_by do |hsh|
  hsh[:published]
end
p books2

# --- Q3
q.call

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
puts arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
puts arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
puts arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
puts hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
puts hsh2[:third].key(0)
puts hsh2[:third].keys[0]


# -- Q4
q.call

arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2

# --- Q5
q.call

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

age_m = 0
munsters.each do |_, v|
  age_m += v['age'] if v['gender'] == 'male'
end
p age_m

# --- Q6
q.call

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |k, v|
  puts "#{k} is a #{v['age']}-year-old #{v['gender']}"
end


# -- Q7
q.call
puts "2; a remains unchanged because arr[0]'s reassignment just points that to a different object"
puts "[3, 8] arr[1][0]'s reassignment of 5 to 3 is reflected in b as well"

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

p a
p b

# --- 8
q.call

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
hsh.each_value do |arr|
  arr.each do |word|
    word.each_char do |char|
      print char if %w(e u i o a).include?(char)
    end
  end
end
puts

# --- 9
q.call
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = arr.map do |sub_array|
  sub_array.sort do |a, b|
    b <=> a
  end
end
p arr
p arr2

# --- 10
q.call
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.map do |hsh|
  hsh2 = {}
  hsh.each do |k, v|
    hsh2[k] = v + 1
  end
  hsh2
end
p arr
p arr2

# --- Q11
q.call
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr2 = arr.map do |arr|
  arr.select do |int|
    int % 3 == 0
  end
end

arr3 = arr.map do |arr|
  arr.reject do |int|
    int % 3 != 0
  end
end
p arr
p arr2
p arr3

# --- Q12
q.call

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]

hsh1 = {}
arr.each do |sub_arr|
  hsh1[sub_arr[0]] = sub_arr[1]
end
p hsh1
p arr.to_h

# --- Q13
q.call

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr2 = arr.sort_by do |arr|
  arr.select do |int|
    int.odd?
  end
end

p arr2

# --- Q14
q.call

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []
counter = 0
hsh.each_value do |traits|
  if traits[:type] == 'fruit'
    arr[counter] = traits[:colors].map do |color|
      color.capitalize
    end
  else
    arr[counter] = traits[:size].upcase
  end
  counter += 1
end
p hsh
p arr

# --- Q15
q.call

arr = [ {a: [1, 2, 3]}, 
        {b: [2, 4, 6], c: [3, 6], d: [4]},
        {e: [8], f: [6, 10]}]

arr2 = arr.select do |hsh|
  hsh.values.all? do |arr|
    arr.all? do |int|
      int.even?
    end
  end
end

p arr2

# --- Q16
q.call

all_chars = ('a'..'z').to_a + ('0'..'9').to_a
p all_chars

hex = ''
8.times do
  hex += all_chars.sample
end
hex += '-'
3.times do
  4.times do
    hex += all_chars.sample
  end
  hex += '-'
end
12.times do
  hex += all_chars.sample
end

p hex
counter = 0
all_chars = ('a'..'z').to_a + ('0'..'9').to_a
arr = [8, 4, 4, 4, 12]

hex2 = arr.map do |int|
  counter += 1
  segment = ''
  int.times do 
    segment += all_chars.sample
  end
  segment
end
hex2 = hex2.join('-')
p hex2