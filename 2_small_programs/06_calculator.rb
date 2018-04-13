# ------------------
# get 2 numbers
# get operation
# perform operation
# ------------------

Kernel.puts("Welcome")

Kernel.print("Enter first number: ")
num1 = Kernel.gets().chomp().to_i()

Kernel.print("Enter second number: ")
num2 = Kernel.gets().chomp().to_i()

Kernel.print("Operation? 1) add 2) subtract 3) multiply 4) divide: ")
op = Kernel.gets().chomp()

if    op == '1'
  ans = num1 + num2
elsif op == '2'
  ans = num1 - num2
elsif op == '3'
  ans = num1 * num2
elsif op == '4'
  ans = num1.to_f() / num2.to_f()
  ans = ans.to_i() if ans == ans.to_i()
else
  ans = 'Invalid operator'
end

puts("Response: #{ans}")
