[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end


=begin
In `line1`, a nested array is intialized. Though the array object is created, there is no variable assigned to point to it.
Instead, we are immediately calling the method `each` on this array object. The block between `do/end` in `lines1-3` is passed as an argument to the method `each`
The local variable `arr` is used to point to each element within our outer array. Each of these elements is themself an array as well
In `line2`, we call the method `puts`, which takes an argument and converts it to string before printing it onto the screen, always with a new line end at the end
The argument we're passing to `puts` is the object returned by `arr.first`
`first` is a method called on the local variable `arr`, and it returns the first element within its calling object.

The `end` in `line3` concludes the block being passed to `each`.

Overall, the program will print `1` and `3` on seaparate lines, and return `nil` because `puts` is a method that returns `nil`.
This program showcases iterating through an array collection where the side effect is the focal point (as opposed to the return value of the iteration)

The method `each` is called on the array initailized in `line1`.