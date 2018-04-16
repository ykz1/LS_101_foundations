# test

a = 1
b = 1
c = a

puts a.object_id
puts b.object_id
puts c.object_id

puts

a += 1

puts a
puts b
puts c

puts

puts a.object_id
puts b.object_id
puts c.object_id

puts
puts 'numbers are immutable. if two variables point to the same number, we cannot change both their return values by changing only one'
puts

puts '---'

z = 'one'
y = 'one'
x = z

puts z
puts y
puts x

puts z.object_id
puts y.object_id
puts x.object_id

puts

z = 'ONE'

puts z
puts y
puts x

puts z.object_id
puts y.object_id
puts x.object_id

puts
puts 'if multiple variables point at the same string object, re-assignment of any one variable does not change the return value of any other variables pointing at the same string'
puts
puts '---'

h = 'two'
i = 'two'
j = h

puts h
puts i
puts j

puts h.object_id
puts i.object_id
puts j.object_id

puts

h.upcase!

puts h
puts i
puts j

puts h.object_id
puts i.object_id
puts j.object_id

puts 
puts 'strings are mutable. calling a destructive method changes the underlying string object, and therefore changes return values of other variables pointing at the same object'
puts

puts '---'

def add_num(num)
  num +=1
end
l = 1
m = 1
n = l

add_num(l)
puts l
puts m
puts n

puts
puts
puts

puts '---'

def append(str)
  str << '*'
end

r = 'abc'
s = 'abc'
t = r

append(r)

puts r
puts s
puts t

puts
puts 'even within a method, mutating a string passed as an argument changes the underlying string object and thereby any other variables pointing to the same obect'

puts '---'
def fix(value)
  value[1] = 'x'
  value
end


s = 'abc'
p s.object_id

t = fix(s)
p s            # "axc"
p t            # "axc"
p s.object_id  # 70349153406320
p t.object_id  # 70349153406320

puts
puts '---'

str = 'hello'
puts "#{str}: #{str.object_id}"
str += ' world'
puts "#{str}: #{str.object_id}"
str << '!'
puts "#{str}: #{str.object_id}"

puts
puts '+= reasigns; << mutates'
