# Start       4:12 PM
# End         4:18 PM


# Arguments: one array, one hash
# Return: string greeting

# Steps

def greetings(arr, hsh)
  puts "Hello, #{arr.join(' ')}! Nice to have a #{hsh.values.join(' ')} around."
end


greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })# => Hello, John Q Doe! Nice to have a Master Plumber around.