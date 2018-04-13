# -------------
# edits after looking at solution:
#   catch negative numbers
#   catch 0 APR entries

require "pry"
amt = ''
apr = ''
duration = ''
response = ''

def prompt(str, new_line=false)
  print "=> #{str}"
  new_line ? print("\n") : print(" ")
end

def valid_num?(i)
  i = clean_num(i)
  i.to_f >= 0 && (
    i.to_f.to_s == i ||
    i.to_i.to_s == i ||
    i.to_f.to_s == '0' + i
  )
end

def clean_num(i)
  i.delete(' ').delete('%')

  counter = i.length - 1
  while counter >= 0
    if i.include?('.') && (i[counter] == '.' || i[counter] == '0')
      i.chop!
    else
      break
    end
    counter -= 1
  end

  i
end

loop do
  prompt("Enter your loan amount:")
  loop do
    amt = gets.chomp
    valid_num?(amt) ? break : prompt("Invalid. Enter a positive number:")
  end
  amt = clean_num(amt).to_f

  prompt("Enter your APR %:")
  loop do
    apr = gets.chomp
    valid_num?(apr) ? break : prompt("Invalid. Enter APR as a positive number:")
  end
  apr = clean_num(apr).to_f

  # Assuming that any APR > 100% is unintentional
  # Applies regardless of whether user inputs a '%'

  apr /= 100 if apr >= 1

  prompt("Enter the duration of your loan in years:")
  loop do
    duration = gets.chomp
    valid_num?(duration) ? break : prompt("Invalid. Enter a positive number:")
  end
  duration = clean_num(duration).to_f

  prompt("You have entered the following:", true)
  prompt("  Loan amount = $#{amt.round(2)}", true)
  prompt("  APR = #{apr.round(4) * 100}%", true)
  prompt("  Duration = #{duration.round(2)} years", true)
  prompt("Is this correct? (y/n):")
  loop do
    response = gets.chomp.downcase
    break if response == 'y' || response == 'n'
    prompt("Please enter 'y' for yes, and 'n' for no:")
  end
  break if response == 'y'
end

rate = apr / 12
nper = duration * 12

pmt = if rate == 0
        amt / nper
      else
        amt * (rate / (1 - (1 + rate)**-nper))
      end

# binding.pry
puts 'calculating...'

puts "Your monthly payment is $#{pmt.round(2)}"
