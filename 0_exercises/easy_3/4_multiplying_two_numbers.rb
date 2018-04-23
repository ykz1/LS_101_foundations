def multiply (num1, num2)
  num1 * num2
end

p multiply(5, 3)                # 15 as expected
p multiply('5', 3)              # '555', 5 is repeated thrice as a string
p multiply([5], 3)              # [5, 5, 5]...interesting, it triples the element within the array as opposed to the array
p multiply([[5],[5]], 3)        # [[5], [5], [5]]...ah, it only goes 1 level into the array
p multiply([5, [5], [[5]]], 3)  # [5, [5], [[5]], 5, [5], [[5]], 5, [5], [[5]]]...just to confirm understanding above
p multiply([5], [3])            # GOOD TRY, SLICK