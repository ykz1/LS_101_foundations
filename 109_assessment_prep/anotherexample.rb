numbers = ['2', '3', '5', '7', '8', '11', '13', '15', '18']
odd_numbers = []

numbers.each do |number|
  odd_numbers << number if number.to_i.odd?
end

=begin
This example demonstrates local variable scoping (being able to access `odd_numbers` from within a block), iterating through a collection with `each`, and conditionally mutating an array object 

On `line1` we initialize the variable `numbers` to point to an array object with 9 elements - all of which are string objects. 
On `line2` we initialize the variable `odd_numbers` to point to an empty array object.
On `line4` we call the `each` method on `numbers`, and pass in the `do/end` `block` in `lines4-5` as an argument. `number` is intialized as a local variable to point to each element of `numbers` as we iterate
On `line5` we have the shovel `<<` method called on `odd_numbers` to append `number` if a condition is met. Worth mentioning that we can see `odd_numbers` from the inner scope created by the `block` passed to `loop`
The condition we are testing is whether `number.to_i.odd?` evalutes to true. Breaking this down, `to_i` is a method called on `number`, and takes the string object and returns an integer object. 
The `odd?` method is then called on this integer object, and returns either `true` or `false` (depending on whether the integer is odd) to our `if` conditional

Ultimately, nothing is printed to the screen, `numbers` is not mutated, `each` returns the original array `numbers`, and `odd_numbers` ends as an array of string objects from `numbers`, but only those whose integer equivalent are odd.

=end