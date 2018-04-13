# ------------------
# Q6. Calculator
# get 2 numbers
# get operation
# perform operation
# ------------------
# Q10. Refactor calculator
# 1. write method for getting input
# 2. change if to case
# 3. validate operator and numbers inputs
# 4. loop entire program
# 5. include get username
# 6. convert operator prompt to multi-line
# 7. remove unecessary ()'s and Kernel's
# ------------------
# Q13. add bonus features to calculator
# 1. Improved integer validation
# 2. added float validation
# 3. altered procedure_msg to save case return to variable
# 4. move messages to yaml configuration doc and call yaml strings
# 5. multiple languages -- didn't do this but followed along

require "yaml"
MESSAGES = YAML.load_file('13_calculator_messages.yaml')

# puts MESSAGES.inspect

num1 = ''
num2 = ''
op = ''

# this is not used anymore since we're using the YAML file
op_prompt = <<-MSG
  What operation?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG

def prompt(k)
  print "=> #{MESSAGES[k]}"
  gets.chomp
end

def valid_num?(i)
  i.to_i.to_s == i || i.to_f.to_s == i ? true : false
end

def valid_op?(i)
  valid_num?(i) && %w(1 2 3 4).include?(i) ? true : false
end

def procedure_msg(n1, n2, op)
  message = case op
            when '1' then "Adding #{n1} and #{n2}..."
            when '2' then "Subtracting #{n1} by #{n2}..."
            when '3' then "Multiplying #{n1} by #{n2}..."
            when '4' then "Dividing #{n1} by #{n2}..."
            end
  message
end

username = prompt('welcome')
loop do
  if username.empty?
    username = prompt('invalid_name')
  else
    break
  end
end

puts "=> Hi! #{username}"

loop do
  loop do
    num1 = prompt('n1')
    valid_num?(num1) ? break : print(MESSAGES['invalid_num'])
  end

  loop do
    num2 = prompt('n2')
    valid_num?(num2) ? break : print(MESSAGES['invalid_num'])
  end

  op = prompt('op_prompt')
  loop do
    valid_op?(op) ? break : op = prompt('invalid_op')
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

  response = prompt('again')
  break unless response.downcase.start_with?('y')
end

puts MESSAGES['goodbye']
