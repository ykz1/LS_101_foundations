# 7_name_swapping.rb

# Start     4:52 PM
# End       4:53 PM

def swap_name(str)
  str.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'