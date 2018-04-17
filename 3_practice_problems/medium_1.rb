megacounter = 1

q = lambda do
  puts
  puts "--- Q#{megacounter}"
  megacounter += 1
end

# --- Q1
q.call
10.times { |i| puts '  ' * i + 'The Flintstones Rock!' }

# --- Q2
q.call
#puts "the value of 40 + 2 is " + (40 + 2)

puts "because (40 + 2) is an integer and needs to be converted to string"

puts 'the value of 40 + 2 is ' + (40 + 2).to_s

print 'the value of 40 + 2 is '
puts (40 + 2)

puts "the value of 40 + 2 is #{40 + 2}"

# --- Q3
q.call
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end

def factors2(number)
  dividend = number
  divisors = []
  while dividend >= 2
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts 'passing 0:'
puts factors2(0)

puts
puts 'passing -3:'
puts factors2(-3)

puts 'number % divident == 0 is a conditional statement that returns true for divisors, i.e. no remainder'
puts
puts 'returns divisor to caller'

# --- Q4
q.call
puts 'rolling_buffer1 mutates the original buffer passed in, rolling_buffer2 does not (it returns a new array)'

# --- Q5
q.call

puts 'The limit variable is outside the scope of the fib method. To fix, pass it in.'
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# --- Q6
q.call

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]
  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# --- Q7
q.call
puts '34'

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# --- Q8
q.call
puts 'yes, because demo_hash points to the same hash as munsters, and the values inside the hash are being re-referenced'

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

# --- Q9
q.call
puts "paper"
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# --- Q10
q.call

puts "no"

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)