# Method 'display_score' feels wrong with 5 arguments...
# ...but rubocop calls on lines being too long otherwise
# ----Edits following code review
# 1. Rend user input case-insensitive
# 2. Moved method definitions to top
# 3. Renamed arguments in method 'display_results'
# 4. Added commenting without code
# 5. Changed previous 'counter' variable to 'user_choice_valid_matches'
# 6. Store scoring in array

# --- Method definitions
def prompt(str)
  puts "=> #{str}"
end

def prompt_w_round(str, int)
  puts "=> [Round #{int}] #{str}"
end

def win?(player1, player2)
  WIN_GRID[player1].include?(player2)
end

def display_results(user_choice, computer_choice, round_num)
  if user_choice == computer_choice
    prompt_w_round("It's a tie!", round_num)
  elsif win?(user_choice, computer_choice)
    prompt_w_round("You win the round!", round_num)
  else
    prompt_w_round("You lose the round!", round_num)
  end
  prompt ''
end

def display_score(name, score1, score2, int)
  prompt_w_round("Score: #{name} #{score1} - #{score2} opponent.", int)
end

# --- Variable initializations
WIN_GRID = {  'scissors' => %w(paper lizard),
              'paper' =>    %w(rock spock),
              'rock' =>     %w(lizard scissors),
              'lizard' =>   %w(spock paper),
              'spock' =>    %w(scissors rock) }
VALID_OPT = WIN_GRID.keys
WIN_SCORE = 5
choice_user = ''
choice_user_str = ''
username = ''
scores = {  round:      1,
            user:       0,
            computer:   0,
            history:    [] }

# --- Game introductions
prompt 'Welcome to Rock-Paper-Scissors-Lizard-Spock'
prompt 'First to win 5 rounds wins the game. Good luck!'
prompt 'Enter your username:'

# --- Get username
username = gets.chomp
if username.empty?
  prompt "We'll just call you Sheldon then"
  username = 'Sheldon'
end

# --- Main game loop
loop do
  # --- Display information for each new round
  prompt('--- New Round ---')
  display_score(username, scores[:user], scores[:computer], scores[:round])
  prompt_w_round("Choose your weapon: #{VALID_OPT.join('/')}", scores[:round])

  # --- Get user selection
  loop do
    choice_user = gets.chomp.downcase
    user_choice_valid_matches = 0

    VALID_OPT.each do |choice|
      if choice.start_with?(choice_user)
        user_choice_valid_matches += 1
        choice_user_str = choice
      end
    end

    if user_choice_valid_matches == 1
      break
    elsif user_choice_valid_matches == 2
      prompt_w_round("Use 'sc' for scissors and 'sp' for spock", scores[:round])
    end
    prompt_w_round('Enter a valid option!', scores[:round])
  end

  # --- Compute and record results
  choice_computer = VALID_OPT.sample
  if win?(choice_user_str, choice_computer)
    scores[:user] += 1
    scores[:history] << username
  elsif win?(choice_computer, choice_user_str)
    scores[:computer] += 1
    scores[:history] << 'Opponent'
  else
    scores[:history] << 'TIE'
  end

  # --- Display results to user
  prompt_w_round("You chose #{choice_user_str}...", scores[:round])
  prompt_w_round("...your opponent chose #{choice_computer}", scores[:round])
  display_results(choice_user_str, choice_computer, scores[:round])

  # --- End-of-game logic and displays
  if scores[:user] == WIN_SCORE || scores[:computer] == WIN_SCORE
    if scores[:user] == WIN_SCORE
      prompt 'You won the game! Final score:'
    else
      prompt 'You lost the game! Final score:'
    end
    prompt "#{username} #{scores[:user]} - #{scores[:computer]} Opponent"
    scores[:history].each_with_index do |winner, key|
      prompt "  Round #{key + 1}: #{winner}"
    end
    break
  end

  scores[:round] += 1
end
