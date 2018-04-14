# -------------
# v.1 edits after looking at solution:
#   catch negative numbers
#   catch 0 APR entries
# -------------
# v.2 edits after code review
# change APR logic to give user choice on 0.1 being 10% versus 0.1%
# fixed clean_num logic to delete spaces and %
# refactored condition to chop last char in clean_num
# changed duration input to duration_years and duration_months
# implement get_num method

require "pry"

amt = ''
apr = ''
duration_years = ''
duration_months = ''
response = ''
APR_UBOUND = 1.0

def prompt(str)
  print "=> #{str} "
end

def prompt_newline(str)
  puts "=> #{str}"
end

def valid_num?(input)
  input = clean_num(input)
  input.to_f >= 0 && (
    input.to_f.to_s == input ||
    input.to_i.to_s == input ||
    input.to_f.to_s == '0' + input
  )
end

def clean_num(input)
  output = input.delete(' ').delete('%')
  counter = output.length - 1
  while counter >= 0
    if output.include?('.') && ['.', '0'].include?(output[counter])
      output.chop!
    else
      break
    end
    counter -= 1
  end
  output
end

def get_num_f(prompt_message, prompt_invalid_message)
  prompt(prompt_message)
  loop do
    output = gets.chomp
    break if valid_num?(output)
    prompt(prompt_invalid_message)
  end
  output
end

def get_num_i(prompt_message, prompt_invalid_message)
  prompt(prompt_message)
  loop do
    output = gets.chomp
    break if output.to_i.to_s == output
    prompt(prompt_invalid_message)
  end
end

def get_response(prompt_message, prompt_invalid_message, allowed_responses)
  prompt(prompt_message)
  loop do
    output = gets.chomp
    break if allowed_responses.include?(output)
    prompt(prompt_invalid_message)
  end
end

loop do
  amt = get_num_f("Enter your loan amount:", "Invalid. Enter positive number:")
  amt = clean_num(amt).to_f

  apr = get_num_f("Enter your APR %:", "Invalid. Enter positive number:")

  apr_has_percent = apr.include?('%')
  apr = clean_num(apr).to_f

  if apr_has_percent || apr > APR_UBOUND
    apr /= 100
  elsif apr > 0
    prompt_newline("Do you mean...")
    prompt_newline(" 1) #{format('%.2f', apr)}%; or")
    prompt_newline(" 2) #{format('%.2f',apr * 100)}%?")
    prompt('')

    response = get_response("Enter 1) or 2):", "Invalid. Enter 1) or 2):", %w(1 2))
    
    apr /= 100 if response == '1'
  end

  prompt_newline("Enter the length of your loan in years and months:")

  duration_years = get_num_i("Years:", "Invalid. Enter a whole number:")
  duration_months = get_num_i("Months:", "Invalid. Enter a whole number:")
  
  duration_years = duration_years.to_i
  duration_months = duration_months.to_i

  prompt_newline("You have entered the following:")
  prompt_newline("  Loan amount = $#{format('%.2f', amt)}")
  prompt_newline("  APR = #{format('%.2f', apr * 100)}%")
  prompt("  Duration = #{duration_years} years")
  duration_months == 0 ? print("\n") : print("and #{duration_months} months\n")
  
  response = get_response("Is this correct? (y/n):", "Invalid. Enter 'y' or 'n'", %w(y n))

rate = apr / 12
nper = duration_years * 12 + duration_months

pmt = if rate == 0
        amt / nper
      else
        amt * (rate / (1 - (1 + rate)**-nper))
      end

# binding.pry
puts 'calculating...'

puts "Your monthly payment is $#{format('%.2f',pmt)}"
