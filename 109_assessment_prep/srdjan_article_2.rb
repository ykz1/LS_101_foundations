a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b

=begin
On `line1`, we are initializing the local variable `a` and assigning it the integer object `4`. `a` now points to this integer object.
On `line3`, we call the method `loop`, and pass in the block between `do/end`, in `lines3-7`, as an argument
On `line4`, we reassign the local variable `a` to a different integer object than what we assigned it to in `line1`. It now points to a different integer object with the value of `5`
Important to note: we can access local variable `a` from within the inner scope created by the `do/end` block passed to loop, but outside this block, we cannot access any variables initialized inside
On `line5`, we initialize the local variable `b` and assign it the integer object `3`. The scope of this variable is the `do/end` block passed to `loop`
On `line6`, we break out of the `loop`
On `line9`, we call the puts method and pass it local variable `a` as an argument. Puts converts `a` from an integer to a string, and prints it on the screen with an ensuing new line
On `line10`, we call the puts method again and try to pass it variable `b`, but since `b` was intiatlized within the `do/end` block passed to loop, `b` is not acessible to `puts`
As a result, we will encounter an error message on `line10` letting us know that `b` is an undefined variable or method.

Overall, this program will print 5 onto the screen, and then return an error message.
=end

a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b

