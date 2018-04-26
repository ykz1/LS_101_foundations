# 10_triangle.rb

def triangle(int)
  (1..int).each { |count| puts ' ' * (int - count) + '*' * count }
end

def triangle2(int, top_down = 0, left_right = 0, sym = '*')
  # left_right: 0 = left; 1 = right
  # top_down:   0 = top; 1 = down
  (1..int).each do |count|
    count = (int - count + 1) * (1 - top_down) + count * top_down
    pad = ' ' * (int - count)
    left = pad * left_right
    right = pad * (1 - left_right)
    content = sym * count
    puts left + content + right
  end
end



triangle2(5)
puts
triangle2(9)
puts

puts "Top left * ----------------"
triangle2(8, 0, 0, '*')
puts "Top right % ---------------"
triangle2(8, 0, 1, '%')
puts "Bottom left $ -------------"
triangle2(8, 1, 0, '$')
puts "Bottom right # ------------"
triangle2(8, 1, 1, '#')


