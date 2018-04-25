greeting = 'Hello'

loop do
  greeting = 'Hi'
  break
end

puts greeting

=begin

This progrma highlights the concepts of variable scoping, and assignment. We initialize, assign, and re-assign a variable before ultimatley printing it.

First, we are initializing the variable `greeting` in `line1` and pointing it to the newly-created string object `'Hello'`. This is an example of assignment.

Next, we call the `loop` method in `line3` and pass in the `block` argument in `line3-6` as contained by `do/end`.

Within this `block`, we re-assign `greeting` to point at a new string object `'Hi'`. Few things to note here:
1. Assignment does not mutate the underlying object, it merely points our variable to a new object.
2. We can access `greeting` from within the inner scope created by `do/end` block.

In `line5`, we `break` out of our `loop` on the first iteration.

Finally, we call the method `puts` and pass to it the variable `greeting` as an argument. `puts` converts this argument to a string (which is moot since `greeting` is already a string), and prints it onto our screen as a new line. `puts` returns `nil`.
=end