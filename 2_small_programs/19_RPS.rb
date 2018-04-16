# ------

VALID_CHOICES = %w(rock paper scissors)
choice_user = ''

def prompt(str)
  puts "=> #{str}"
end

def win?(player1, player2)
  player1 == 'rock'       &&  player2 == 'scissors' ||
    player1 == 'paper'    &&  player2 == 'rock' ||
    player1 == 'scissors' &&  player2 == 'paper'
end

def display_results(user, computer)
  if user == computer
    prompt "It's a tie!"
  elsif win?(user, computer)
    prompt "You win!"
  else
    prompt "You lose!"
  end
end

prompt 'Welcome to RFP v1.0!'

prompt "Select your weapon: #{VALID_CHOICES.join(', ')}"

loop do
  choice_user = gets.chomp
  break if VALID_CHOICES.include?(choice_user)
  prompt 'Enter a valid option!'
end

choice_computer = VALID_CHOICES.sample

prompt "You chose #{choice_user}, your opponent chose #{choice_computer}..."

display_results(choice_user, choice_computer)
