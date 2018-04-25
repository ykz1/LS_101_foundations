[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end


=begin

This program is an exmaple of iterating through a collection, and returning a transformed collection as a result. Specifically, we are acting on a multi-level nested array object, and calling the `map` method to return a new, transformed array object without mutating the original array object.

In `line1`, we initalze our outer nested array object. Instead of assigning a variable to point at it, we call the method `map` on this array, and pass a `block` as an argument to `map`.
The `block` argument we are passing is in `lines1-11`, surrounded by `do/end`. Within this block, we initiatlize local variable `arr` to represent the elements of our outer array, each of which is an array itself.

In `line2`, we again call the `map` method, this time on `arr` (our inner arrays). The `do/end` `block` in `lines2-10` is passed as an argument to this `map`, and inside it we initialize `el` to point to each element within `arr`
In `line3`, we have a conditional that evalutes our code to either `true` or `false`, and takes us to `line4` or `lines6-8`, respectively.
We call the method `to_s` on `el`, this returns a new string object converted from our caller `el`. We then call the method `size` on our string object, which returns an integer value of the size / length of our string. This return value is compared with `1` via the `==` comparison operator to return either `true` or `false` to our if conditional
In `line4`, we call the `+` method on `el`, with `1` passed as an object, and return an integer value
In `line6`, we call yet another `map` method, this time on `el`, passing the `do/end` `block` in `lines6-8` as an argument. `n` is intialized as a local variable to point to each element of `el`.
`Line7`, similar to `line4`, calls the `+` method and passes `1` as an argument, this time incrementing `n` by 1 and return the integer result.
`Lines8-11` concludes, respectively, our innermost `map`, our `if` conditional, our inner `map`, and lastly our outer `map`.

This program will return the following nested array as a new object, has no side-effect, and does not mutate the original array initalized in `line1`
=> [[[2, 3], [4, 5]], [6, 7]]

=end