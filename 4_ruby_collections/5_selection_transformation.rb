# ---
puts

puts '---'
produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}



def select_fruit(hsh)
  counter = 0
  arr = hsh.to_a
  output = []
  loop do
    if arr[counter][1] == 'Fruit'
      output << arr[counter]
    end
    counter += 1
    break if counter == arr.size
  end
  output.to_h
end

p select_fruit(produce)


def select_fruit2(hsh)
  counter = 0
  output = {}
  arr_keys = hsh.keys
  loop do
    key = arr_keys[counter]
    if hsh[key] == 'Fruit'
      output[key] = hsh[key]
    end
    counter += 1
    break if counter == arr_keys.size
  end
  output
end
p select_fruit2(produce)

# ---
puts

puts '---'
def double_numbers!(numbers)

  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end

end

my_numbers = [1, 4, 3, 7, 2, 6]
p my_numbers
double_numbers!(my_numbers)
p my_numbers

# ---
puts
puts '---'

def double_odd_indices(numbers)
  counter = 0
  output = []
  loop do
    break if counter == numbers.size
    current_number = numbers[counter]
    if counter % 2 == 0 then
      output << current_number
    else
      output << current_number * 2
    end
    counter += 1
  end
output
end
my_numbers = [1, 4, 3, 7, 2, 6]
p double_odd_indices(my_numbers)

# ---
puts
puts '---'

def multiply(numbers, by)
  counter = 0
  output = []
  loop do
    output[counter] = numbers[counter] * by
    counter += 1
    break if counter == numbers.size
  end
  output
end

my_numbers = [1, 4, 3, 7, 2, 6]
p multiply(my_numbers, 3)

