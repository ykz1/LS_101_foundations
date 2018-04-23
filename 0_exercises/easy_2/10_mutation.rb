array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

puts "[Moe, Larry, CURLY, SHEMP, Harpo, CHICO, Groucho, Zeppo]"
puts "Line 1 assigns the array of names to 'array1'...which means that 'array1' is now a variable pointing to the array object containing the 8 individual string objects"
puts "Line 2 assigns 'array2' to point to a new blank array object"
puts "Line 3 iterates through 'array1' with the each method, passing a block that pushes each element in 'array1' to the end of 'array2'"
puts "  worth noting that the elements pushed into 'array2' are the same string objects contained in 'array1'"
puts "  this means that although 'array1' and 'array1' point to different array objects, those two array objects contain the same"
puts "  underlying 8 string objects"
puts "Line 4 iterates through 'array1' in the same way as line 3, with the each method passing each element in 'array1'"
puts "  however, line 4 mutates all the string objects that start with 'C' or 'S' by changing them to uppercase"
puts "  because line 4 mutates the underlying string objects, which are shared between 'array1' and 'array2'"
puts "  'array2' now also contains string objects with Curly, Shemp, and Chico all capitalized"
