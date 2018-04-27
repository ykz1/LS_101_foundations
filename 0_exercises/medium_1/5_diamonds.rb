# 5_diamonds.rb

# Start     11:07 AM
# End       11:17 PM

=begin
1: 1

3: 131

5: 13531

7: 1357531
=end

require "pry"

def diamond(int)
  puts
  n = 1
  increment = 2
  loop do
    print_line2(n, int)
    increment = -2 if n == int
    n += increment
    break if n < 1
  end

end

def print_line(stars, line_length)
  puts ("*" * stars).center(line_length)
end

def print_line2(stars, line_length)
  if stars == 1
    print_line(stars, line_length)
  else
    puts ('*' + ' ' * (stars - 2) + '*').center(line_length)
  end
end

diamond(1)
diamond(5)
diamond(7)
diamond(9)

=begin
5: 2, 4
7: 3, 6




=end