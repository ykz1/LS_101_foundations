def example(str)
  i = 3
  loop do
    puts str
    i -= 1
    break if i == 0
  end
end

p example('hello')


=begin
`line1-8` is a method definition for the method `example`, which takes one parameter
`line2`, we initialize the local variable `i`, and assign it to the integer object `3`. going forward, `i` is a pointer to this integer object
`line3` we're calling the method loop, and passing it the `block` between `line3-7` within `do/end` 
`line4`, we call the method puts, and pass it `str` as an argument. Note that `str` is a parameter in the method `example`'s definition, but is an `argument` passed to puts()
`line5`, we call the method `-` on caller `i`. this is the equivalent of `i = i - 1`, and is a reassignment of the variable `i` to a new integer object
`line6`, we are conditionally calling the method `break` to exit out of the `loop`. the condition that needs to be met is that `i` needs to equal `0`
Important to note here the difference between `=`, which is an assignment, and `==`, which is an operator checking for equality between two objects
`line10`, we call our method `example` and pass in the string `'hello'` as an argument. 'hello' is printed 3 times, each on a new line, and the method returns `nil`
This code does not have a 
=end