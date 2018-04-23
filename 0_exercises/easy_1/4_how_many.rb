def count_occurrences(arr)
  counter = 0
  hsh = Hash.new
  loop do
    if hsh[arr[counter]] != nil
      hsh[arr[counter]] += 1
    else
      hsh[arr[counter]] = 1
    end
    counter +=1
    break if counter == arr.size
  end
  
  hsh.each do |key, value|
    puts "#{key} => #{value}"
  end
end

def count_occurrences2(arr)
  counter = 0
  uniques = arr.uniq
  loop do
    puts "#{uniques[counter]} => #{arr.count(uniques[counter])}"
    counter += 1
    break if counter == uniques.size
  end
end

def count_occurrences3(arr)
  arr.uniq.each { |item| puts("#{item} => #{arr.count(item)}") }
end


vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
puts
count_occurrences2(vehicles)
puts
count_occurrences3(vehicles)