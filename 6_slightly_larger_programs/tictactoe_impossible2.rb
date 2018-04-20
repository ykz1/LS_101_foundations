require "pry"
# =============================================================================
# VARIABLE DECLARATIONS
board = []
available_moves = {}
input = ''
computer_move = ''
result = ''
difficulty = 1

score = { uname: '',
          games: 1,
          rounds: 1,
          user: 0,
          comp: 0 }

# =============================================================================
# METHODS
def prompt(str)
  puts "=> #{str}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board, data, difficulty)
  system "clear"
  puts "===== GAME #{data[:games]} - ROUND #{data[:rounds]}"
  puts "===== DIFFICULTY: #{difficulty}"
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
# rubocop:enable Metrics/AbcSize

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

def get_user_move(hsh_available_moves)
  input = ''
  loop do
    input = gets.chomp.to_s.downcase
    break if hsh_available_moves.keys.include?(input)
    prompt "Pick a valid move!"
  end
  input
end

def record_move(hsh_available_moves, arr_board, str_move, str_player_symbol)
  row, col = hsh_available_moves[str_move]
  arr_board[row][col] = str_player_symbol
  hsh_available_moves.delete(str_move)
end

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
def generate_move(hsh_available_moves, arr_board, difficulty)
  if difficulty == 1
    selected_move = hsh_available_moves.keys.sample
  elsif difficulty == 2
    selected_move = generate_move2(hsh_available_moves, arr_board)
  else
    viable_moves = hsh_available_moves.clone
    selected_move = generate_move_inner(viable_moves, hsh_available_moves, arr_board, true)
  end

  selected_move
end

def generate_move_inner(viable_moves, hsh_available_moves, arr_board, impossible = false, current_comp = true, moves_taken = [])
  selected_move = ''
  if current_comp == true
    me = 'O'
    you = 'X'
  else
    me = 'X'
    you = 'O'
  end

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
  if selected_move == ''
    if impossible
      hsh_scored_moves = {}
      hsh_available_moves.keys.each do |move|
        hsh_scored_moves[move] = score_move()
      end
      selected_move = hsh_scored_moves.key(hsh_scored_moves.values.sort.pop)
    else
      if hsh_available_moves.keys.include?('b2')
        selected_move = 'b2' 
      else
        selected_move = hsh_available_moves.keys.sample
      end
    end
  end
end

def score_move(move, moves, board, player,score)
  moves_hypothetical = moves.clone
  moves_hypothetical.delete(move)
  coordinates = moves[move]
  board_hypothetical = generate_hypothetical_board(board, coordinates, me)

  if selected_move == ''
    if impossible
      hsh_available_moves.keys.each do |move|
        moves_taken << move
        hypothetical_available_moves = hsh_available_moves.clone
        hypothetical_available_moves.delete(move)
        coordinates = hsh_available_moves[move]
        hypothetical_board = generate_hypothetical_board(arr_board, coordinates, me)
        if winner?(hypothetical_board, 'X')
          binding.pry
          viable_moves.delete(moves_taken[0])
        else
          generate_move_inner(viable_moves, hypothetical_available_moves, hypothetical_board, impossible, !current_comp, moves_taken)
        end
      end
      selected_move = viable_moves.keys.sample
    else
      if hsh_available_moves.keys.include?('b2')
        selected_move = 'b2' 
      else
        selected_move = hsh_available_moves.keys.sample
      end
    end
  end

  selected_move
end

def generate_move4(hsh_available_moves, arr_board)
  hsh_winning_moves = {}
  hsh_viable_moves = hsh_available_moves.clone
  generate_move3(hsh_winning_moves, hsh_viable_moves, hsh_available_moves, arr_board)
  if hsh_winning_moves.empty?
    selected_move = hsh_viable_moves.keys.sample
  else
    selected_move = hsh_winning_moves.keys.sample
  end
end

def generate_move3(hsh_winning_moves, hsh_viable_moves, hsh_available_moves, arr_board, current_comp = true)
  if current_comp == true
    me = 'O'
    you = 'X'
  else
    me = 'X'
    you = 'O'
  end
  
  hsh_available_moves.keys.each do |move|
    hypothetical_available_moves = hsh_available_moves.clone
    hypothetical_available_moves.delete(move)
    coordinates = hsh_available_moves[move]
    hypothetical_board = generate_hypothetical_board(arr_board, coordinates, me)
    if winner?(hypothetical_board, 'X')
      hsh_viable_moves.delete(move)
    elsif winner?(hypothetical_board, 'O')
      hsh_winning_moves[move] = hsh_available_moves[move]
    else
      generate_move3(hsh_winning_moves, hsh_viable_moves, hypothetical_available_moves, hypothetical_board, !current_comp)
    end
  end
end


def generate_move2(hsh_available_moves, arr_board)
  selected_move = generate_move_internal(hsh_available_moves, arr_board)
  if selected_move == ''
    if hsh_available_moves.keys.include?('b2')
      selected_move = 'b2' 
    else
      selected_move = hsh_available_moves.keys.sample
    end
  end
  selected_move
end

def generate_move_internal(hsh_available_moves, arr_board, current_comp=true)
  if current_comp == true
    me = 'O'
    you = 'X'
  else
    me = 'X'
    you = 'O'
  end

  selected_move = ''

  hsh_available_moves.keys.each do |move|
    coordinates = hsh_available_moves[move]

    board_offense = generate_hypothetical_board(arr_board, coordinates, me)
    board_defense = generate_hypothetical_board(arr_board, coordinates, you)

    if winner?(board_offense, me)
      selected_move = move
      break
    elsif winner?(board_defense, you)
      selected_move = move
    end
  end

  if selected_move == ''
    hsh_available_moves.keys.each do |move|
      hypothetical_available_moves = hsh_available_moves.clone
      hypothetical_available_moves.delete(move)
      coordinates = hsh_available_moves[move]
      hypothetical_board = generate_hypothetical_board(arr_board, coordinates, me)
      selected_move = generate_move_internal(hypothetical_available_moves, hypothetical_board, !current_comp)
    end
  end

  selected_move
end

def winner?(board, xo)
  win = false

  win = true if winner_horizontal_vertical?(board, xo) ||
                [board[0][0], board[1][1], board[2][2]] == [xo, xo, xo] ||
                [board[2][0], board[1][1], board[0][2]] == [xo, xo, xo]

  win
end

def winner_horizontal_vertical?(board, xo)
  win = false
  (0..2).each do |count|
    if board[count] == [xo, xo, xo]
      win = true
    elsif [board[0][count], board[1][count], board[2][count]] == [xo, xo, xo]
      win = true
    end
  end
  win
end

def check_result(hsh_available_moves, arr_board, str_symbol, score)
  result = nil
  if winner?(arr_board, str_symbol) 
    if str_symbol == 'X'
      result = "You win!"
      score[:user] += 1
    else
      result = "You lose!"
      score[:comp] += 1
    end
  elsif hsh_available_moves.empty?
    result = "It's a tie!"
  end
  result
end

def play_again?
  input = ''
  loop do
    input = gets.chomp.downcase
    break if %(y n).include?(input)
    prompt "Enter either 'y' or 'n'"
  end
  
  prompt "Thanks for playing!" if input =='n'

  input == 'y'
end

# =============================================================================
# PROGRAM: INTRODUCTION & INPUT

system "clear"
prompt "Welcome to Kyle's Tic-Tac-Toe!"
prompt "What's your name?"

score[:uname] = gets.chomp.to_s.strip
if score[:uname] == ''
  score[:uname] = %w[Sheldon Leonard Howard Raj Penny Bernadette Amy].sample
  prompt "We'll just call you #{score[:uname]} then!"
end
prompt "#{score[:uname]}, what difficulty would you like to play?"
prompt "  1) Easy"
prompt "  2) Medium"
prompt "  3) Impossible"
loop do
  difficulty = gets.chomp.to_i
  break if (1..3).include?(difficulty)
  prompt "Enter either 1, 2, or 3"
end
prompt "Let's battle, #{score[:uname]}! Click enter to begin"
gets

# =============================================================================
# PROGRAM: MAIN LOOP TO PLAY GAME
loop do
  board = [[' ', ' ', ' '],
           [' ', ' ', ' '],
           [' ', ' ', ' ']]
  available_moves = { "a1" => [0, 0], "a2" => [0, 1], "a3" => [0, 2],
                      "b1" => [1, 0], "b2" => [1, 1], "b3" => [1, 2],
                      "c1" => [2, 0], "c2" => [2, 1], "c3" => [2, 2] }
  score[:rounds] = 1

  loop do
    display_board(board, score, difficulty)
    prompt "You picked #{input.capitalize}" unless input == ''
    prompt "Computer chooses #{computer_move.capitalize}" unless computer_move == ''
    
    prompt "Pick an available move:"
    display_moves(available_moves)
    input = get_user_move(available_moves)
    
    record_move(available_moves, board, input, 'X')
    result = check_result(available_moves, board, 'X', score)
    break unless result == nil

    computer_move = generate_move(available_moves, board, difficulty)
    record_move(available_moves, board, computer_move, 'O')
    result = check_result(available_moves, board, 'O', score)
    break unless result == nil

    score[:rounds] += 1
  end

  display_board(board, score, difficulty)
  prompt result
  prompt "Would you like to play again? (y/n)"
  break unless play_again?


  score[:games] += 1
end
