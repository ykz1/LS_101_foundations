name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

puts "In line 1, the variable 'name' is assigned (i.e. it points to) the string object containing 'Bob'"
puts "In line 2, the variable 'save_name' is assigned to point to the same string object as 'name', which is 'Bob'"
puts "In line 3, the method upcase! is called on 'name'. Because upcase! is a mutating method, what this actually means"
puts "  is that the underlying string object 'Bob' is being acted upon. It becomes 'BOB'"
puts "Whereas in the first example, where 'name' was simply re-assigned to a new string object (one that's different from 'save_name',"
puts " in this example, 'name' and 'save_name' still both point at the same underlying string object, which now says 'BOB'"
puts "As a result, line 4 prints the same string object twice, using the two variables that point to it"