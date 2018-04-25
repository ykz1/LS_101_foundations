def print_in_box(str)
  len = str.length
  puts '+-' + '-' * len + '-+'
  puts '| ' + ' ' * len + ' |'
  puts '| ' + str + ' |'
  puts '| ' + ' ' * len + ' |'
  puts '+-' + '-' * len + '-+'
end

def print_in_box2(str, width = 80)
  max_len = width - 4
  len = [max_len, str.length].min
  arr_str = []
  while str.length > max_len
    arr_str << str.slice!(0..max_len - 1)
  end
  arr_str << str
  puts '+-' + '-' * len + '-+'
  puts '| ' + ' ' * len + ' |'
  arr_str.each do |segment| 
    padding = len - segment.length
    puts '| ' + segment + ' ' * padding + ' |'
  end
  puts '| ' + ' ' * len + ' |'
  puts '+-' + '-' * len + '-+'
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

print_in_box2('To boldly go where no one has gone before.',10)
print_in_box2('')
print_in_box2("This is an abnormally long sentence designed to test the outer limits of Kyle's greatest creation yet -- a ruby method ambitious enough to contain human thought, creativity, grandeur, RAINBOWS into a measly box.")