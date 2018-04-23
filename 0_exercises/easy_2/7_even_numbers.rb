(1..99).each { |num| print num if num.even? }
puts

print (1..99).select { |num| num.even? }
puts

(2..98).step(2) { |num| print num }
puts

num = 2
while num <= 99
  print num
  num += 2
end
puts