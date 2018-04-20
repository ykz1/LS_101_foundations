
require "pry"

# =============================================================================
# VARIABLE INITIATIONS

board = []
available_moves = {}
input = ''
result = ''

score = { uname: '',
          games: 1,
          rounds: 1,
          user: 0,
          comp: 0 }

# =============================================================================
# METHODS

# Prompt method
def prompt(str)
  puts "=> #{str}"
end

# Display the current board
def display_board(board, data)
  system "clear"
  puts "===== GAME #{data[:games]} - ROUND #{data[:rounds]}"
  puts "===== SCORE: #{data[:uname]} #{data[:user]}-#{data[:comp]} Computer"
  puts
  puts "      1   2   3"
  puts
  puts "  A   #{board[0][0]} | #{board[0][1]} | #{board[0][2]} "
  puts "     --- --- ---"
  puts "  B   #{board[1][0]} | #{board[1][1]} | #{board[1][2]} "
  puts "     --- --- ---"
  puts "  C   #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
  puts
end

# Display available moves
def display_moves(hsh)
  arr1 = hsh.keys
  arr2 = hsh.values
  (0..2).each do |row|
    (0..2).each do |col|
      print '  '
      if arr2.include?([row, col])
        print arr1[arr2.index([row, col])].capitalize
      else
        print '  '
      end
      print ' '
    end
    print "\n"
  end
end

# Record move taken
def record_move(hsh_available_moves, arr_board, str_move, str_player_symbol)
  row, col = hsh_available_moves[str_move]
  arr_board[row][col] = str_player_symbol
  hsh_available_moves.delete(str_move)
end

# Return hypothetical board
def generate_hypothetical_board(arr_board, arr_coordinates, str_player_symbol)
  hypothetical_board = [[], [], []]
  (0..2).each do |row|
    (0..2).each do |col|
      if [row, col] == arr_coordinates
        hypothetical_board[row].push(str_player_symbol)
      else
        hypothetical_board[row].push(arr_board[row][col])
      end
    end
  end
  hypothetical_board
end

# Generate move: one forward-move intelligence
def generate_move(hsh_available_moves, arr_board)
  selected_move = ''
  # Move selection priority:
  #  1. Take any moves that would result in a win this round
  #  2. Block any moves that would allow opponent to win next round

  hsh_available_moves.keys.each do |move|
    coordinates = hsh_available_moves[move]

    board_defense = generate_hypothetical_board(arr_board, coordinates, 'X')
    board_offense = generate_hypothetical_board(arr_board, coordinates, 'O')

    if winner?(board_offense, 'O')
      selected_move = move
      break
    elsif winner?(board_defense, 'X')
      selected_move = move
    end
  end

  # Generate random move otherwise
  selected_move = hsh_available_moves.keys.sample if selected_move == ''

  # Return selected move
  selected_move
end

# Return whether or not user wins
def winner?(board, xo)
  win = false

  # Check horizontal and vertical win
  (0..2).each do |count|
    if board[count] == [xo, xo, xo]
      win = true
    elsif [board[0][count], board[1][count], board[2][count]] == [xo, xo, xo]
      win = true
    end
  end

  # Check diagonal win
  win = true if [board[0][0], board[1][1], board[2][2]] == [xo, xo, xo]
  win = true if [board[2][0], board[1][1], board[0][2]] == [xo, xo, xo]

  win
end

# =============================================================================
# PROGRAM: INTRODUCTION & INPUT

system "clear"
prompt "Welcome to Kyle's Tic-Tac-Toe!"
prompt "What's your name?"

score[:uname] = gets.chomp.to_s
if score[:uname] == ''
  score[:uname] = %w[Sheldon Leonard Howard Raj Penny Bernadette Amy].sample
  prompt "We'll just call you #{score[:uname]} then!"
end
gets

# =============================================================================
# PROGRAM: MAIN LOOP TO PLAY GAME
loop do
  # Initiatlize / reset board
  board = [[' ', ' ', ' '],
           [' ', ' ', ' '],
           [' ', ' ', ' ']]
  available_moves = { "a1" => [0, 0], "a2" => [0, 1], "a3" => [0, 2],
                      "b1" => [1, 0], "b2" => [1, 1], "b3" => [1, 2],
                      "c1" => [2, 0], "c2" => [2, 1], "c3" => [2, 2] }
  score[:rounds] = 1

  # Loop rounds until winner or tie
  loop do
    # User move selection
    display_board(board, score)
    prompt "Pick an available move:"
    display_moves(available_moves)

    loop do
      input = gets.chomp.to_s.downcase
      break if available_moves.keys.include?(input)
      prompt "Pick a valid move!"
    end

    prompt "You picked #{input.capitalize}"

    # Record user selection
    record_move(available_moves, board, input, 'X')

    # Test whether user wins
    if winner?(board, 'X')
      result = "You win!"
      score[:user] += 1
      break
    elsif available_moves.empty?
      result = "It's a tie!"
      break
    end

    # Computer randomly generates move
    move = generate_move(available_moves, board)
    prompt "Computer chooses #{move.capitalize}"

    # Record computer selection
    record_move(available_moves, board, move, 'O')

    # Test whether computer wins
    if winner?(board, 'O')
      result = 'You lose!'
      score[:comp] += 1
      break
    elsif available_moves.empty?
      result = "It's a tie!"
      break
    end

    score[:rounds] += 1
  end

  # End-of-game options
  display_board(board, score)
  prompt result
  prompt "Would you like to play again? (y/n)"

  loop do
    input = gets.chomp.downcase[0]
    break if %(y n).include?(input)
    prompt "Enter either 'y' or 'n'"
  end
  if input == 'n'
    prompt "Thanks for playing!"
    break
  end

  score[:games] += 1
end
