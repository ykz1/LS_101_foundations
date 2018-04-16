# Method 'display_score' feels wrong with 5 arguments...
# ...but rubocop calls on lines being too long otherwise

WIN_GRID = {  'scissors' => %w(paper lizard),
              'paper' =>    %w(rock spock),
              'rock' =>     %w(lizard scissors),
              'lizard' =>   %w(spock paper),
              'spock' =>    %w(scissors rock) }
VALID_CHOICES = WIN_GRID.keys
WIN_SCORE = 5

choice_user = ''
choice_user_str = ''
username = ''
round = 1
score_user = 0
score_computer = 0

def prompt(str)
  puts "=> #{str}"
end

def prompt_w_round(str, int)
  puts "=> [Round #{int}] #{str}"
end

def win?(player1, player2)
  WIN_GRID[player1].include?(player2)
end

def display_results(user, computer, round_num)
  if user == computer
    prompt_w_round("It's a tie!", round_num)
  elsif win?(user, computer)
    prompt_w_round("You win the round!", round_num)
  else
    prompt_w_round("You lose the round!", round_num)
  end
  prompt ''
end

def display_score(str, name, score1, score2, int)
  prompt_w_round("#{str} #{name}: #{score1} - #{score2} opponent.", int)
end

prompt 'Welcome to Rock-Paper-Scissors-Lizard-Spock'
prompt 'First to win 5 rounds wins the game. Good luck!'
prompt 'Enter your username:'

username = gets.chomp
if username.empty?
  prompt "We'll just call you Sheldon then"
  username = 'Sheldon'
end

loop do
  prompt('--- New Round ---')
  display_score("Score: ", username, score_user, score_computer, round)
  prompt_w_round("Select your weapon: #{VALID_CHOICES.join(', ')}", round)

  loop do
    choice_user = gets.chomp
    counter = 0

    VALID_CHOICES.each do |choice|
      if choice.start_with?(choice_user)
        counter += 1
        choice_user_str = choice
      end
    end

    if counter == 1
      break
    elsif counter == 2
      prompt_w_round("Use 'sc' for scissors and 'sp' for spock", round)
    end
    prompt_w_round('Enter a valid option!', round)
  end

  choice_computer = VALID_CHOICES.sample
  score_user      += 1 if win?(choice_user_str, choice_computer)
  score_computer  += 1 if win?(choice_computer, choice_user_str)

  prompt_w_round("You chose #{choice_user_str}...", round)
  prompt_w_round("...your opponent chose #{choice_computer}", round)
  display_results(choice_user_str, choice_computer, round)

  if score_user == WIN_SCORE
    prompt "You win the game!"
    display_score("Final score:", username, score_user, score_computer, round)
    break
  elsif score_computer == WIN_SCORE
    prompt "You lost the game!"
    display_score("Final score:", username, score_user, score_computer, round)
    break
  end

  round += 1
end
