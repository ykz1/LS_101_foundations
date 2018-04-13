# ------------------
# get 2 numbers
# get operation
# perform operation
# ------------------
# REFACTOR:
# 1. write method for getting input
# 2. change if to case
# 3. validate operator and numbers inputs
# 4. loop entire program
# 5. include get username
# 6. convert operator prompt to multi-line
# 7. remove unecessary ()'s and Kernel's

num1 = ''
num2 = ''
op = ''
op_prompt = <<-MSG
  What operation?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG

def prompt(str)
  print "=> #{str}"
  gets.chomp
end

def valid_num?(i)
  i.to_i != 0 ? true : false
end

def valid_op?(i)
  valid_num?(i) && %w(1 2 3 4).include?(i) ? true : false
end

def procedure_msg(n1, n2, op)
  case op
  when '1' then "Adding #{n1} and #{n2}..."
  when '2' then "Subtracting #{n1} by #{n2}..."
  when '3' then "Multiplying #{n1} by #{n2}..."
  when '4' then "Dividing #{n1} by #{n2}..."
  end
end

username = prompt("Welcome! What's your name? ")
loop do
  if username.empty?
    username = prompt("Make sure to enter a valid name! ")
  else
    break
  end
end

puts "=> Hi! #{username}"

loop do
  loop do
    num1 = prompt("Enter first number: ")
    valid_num?(num1) ? break : print("=> Invalid input. Enter a number\n")
  end

  loop do
    num2 = prompt("Enter second number: ")
    valid_num?(num2) ? break : print("=> Invalid input. Enter a number\n")
  end

  op = prompt(op_prompt)
  loop do
    valid_op?(op) ? break : op = prompt("Invalid operator. Try again: ")
  end
  puts "=> "

  puts "=> #{procedure_msg(num1, num2, op)}"

  num1 = num1.to_i
  num2 = num2.to_i

  ans = case op
        when '1' then num1 + num2
        when '2' then num1 - num2
        when '3' then num1 * num2
        when '4' then num1.to_f / num2.to_f
        end

  ans = ans.to_i if ans == ans.to_i

  puts "=> Response: #{ans}"

  response = prompt("Do you want to perform another calculation? ")
  break unless response.downcase.start_with?('y')
end

puts "=> Thanks for using Kyle's refactored calculator!"
