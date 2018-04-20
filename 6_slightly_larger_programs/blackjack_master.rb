# =============================================================================
# VARIABLES
data = {  cap: 21,
          name: 'Player',
          nrounds: 5,
          round: 1,
          game: 1,
          score_user: 0,
          score_comp: 0,
          points_user: 0,
          points_comp: 0,
          games_user: 0,
          games_comp: 0 }
RANDOM_NAMES = %w[Sheldon Leonard Howard Raj Penny Bernadette Amy]
NAMES = %w[Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace]
SUITES = %w[Diamonds Clubs Hearts Spades]
BUFFER = 4

input = ''
dealer_hand = []
player_hand = []
message = ''
# =============================================================================
# METHODS
def prompt(str)
  puts "=> #{str}"
end

# rubocop:disable Metrics/LineLength
def display_heading(data)
  system "clear"
  puts "======================================================================"
  puts "BLACKJACK(ish)"
  puts "RULES: cap at #{data[:cap]}, first to #{data[:nrounds]} rounds wins game"
  puts "GAME  #{data[:game]}: #{data[:name]} #{data[:games_user]} - #{data[:games_comp]} Dealer"
  puts "ROUND #{data[:round]}: #{data[:name]} #{data[:score_user]} - #{data[:score_comp]} Dealer"
  puts
end
# rubocop:enable Metrics/LineLength

def get_username(random_names)
  input = gets.chomp.to_s.strip
  if input == ''
    input = random_names.sample
    prompt "We'll just call you #{input} then!"
  end
  input
end

def get_number_between(low, hi)
  input = ''
  loop do
    input = gets.chomp.to_i
    break if (low..hi).cover?(input)
    prompt "Enter a number between #{low} and #{hi}"
  end
  input
end

def initialize_deck(names, suites)
  dck = {}
  names.each_with_index do |num, idx|
    suites.each do |suite|
      value = [idx + 2, 10].min
      value = 11 if num == 'Ace'
      dck[suite[0] + (idx + 2).to_s] = {  name: "#{num} of #{suite}",
                                          value: value,
                                          location: 'undealt' }
    end
  end
  dck
end

def draw_card(dck, str)
  drawn = dck.select { |_, card| card[:location] == 'undealt' }.keys.sample
  dck[drawn][:location] = str
  drawn
end

def calculate_points(dck, str, data)
  points = 0
  dck.each do |_, card|
    if card[:location] == str
      points += card[:value]
      if card[:value] == 11 && points > data[:cap]
        card[:value] = 1
        points -= 10
      end
    end
  end

  points
end

# rubocop:disable Metrics/AbcSize
def show_hands(dck, dlr, plr, data, endgame)
  display_heading(data)
  if endgame
    prompt "Dealer has #{data[:points_comp]} points:"
    show_cards(dlr, dck)
  else
    prompt "Dealer showing..."
    prompt "  " + dck[dlr[0]][:name] + ' ' + dck[dlr[0]][:value].to_s
    prompt "...and an unknown card"
  end
  puts
  prompt "Player has #{data[:points_user]} points:"
  show_cards(plr, dck)
end
# rubocop:enable Metrics/AbcSize

def show_cards(hand, dck)
  hand.each do |card|
    prompt '  ' + dck[card][:name] + ' ' + dck[card][:value].to_s
  end
end

def player_hit?
  prompt "Hit or stay? (h/s)"
  response = ''
  loop do
    response = gets.chomp.to_s.downcase
    if response == 'h'
      response = true
      break
    elsif response == 's'
      response = false
      break
    else
      prompt "Enter 'h' or 's'"
    end
  end
  response
end
# =============================================================================
# PROGRAM: INTRODUCTION
system "clear"
display_heading(data)
puts "======================================================================"
prompt "Welcome! What's your name?"
data[:name] = get_username(RANDOM_NAMES)

prompt "How many rounds to win a game, #{data[:name]}?"
data[:nrounds] = get_number_between(1, 99)

prompt "#{data[:name]}, where do you want to set BLACKJACK to?"
data[:cap] = get_number_between(21, 99)

display_heading(data)
prompt "Let's get started then! Press enter to continue"
gets

# =============================================================================
# PROGRAM: MAIN PROGRAM
loop do
  data[:score_comp] = 0
  data[:score_user] = 0
  data[:round] = 1
  loop do
    deck = initialize_deck(NAMES, SUITES)
    dealer_hand = []
    player_hand = []

    2.times do
      dealer_hand << draw_card(deck, 'dealer')
      player_hand << draw_card(deck, 'player')
    end

    data[:points_user] = calculate_points(deck, 'player', data)
    show_hands(deck, dealer_hand, player_hand, data, false)

    loop do
      if data[:points_user] == data[:cap]
        show_hands(deck, dealer_hand, player_hand, data, false)
        prompt "Blackjack!"
        prompt "Let's see what the dealer gets..."
        gets
        break

      elsif player_hit?
        player_hand << draw_card(deck, 'player')
        data[:points_user] = calculate_points(deck, 'player', data)
        show_hands(deck, dealer_hand, player_hand, data, false)

        break if data[:points_user] > data[:cap]
      else
        break
      end
    end

    data[:points_comp] = calculate_points(deck, 'dealer', data)

    if data[:points_user] <= data[:cap]
      dealer_comparison_point = [data[:cap] - BUFFER, data[:points_user]].min
      loop do
        if data[:points_comp] <= data[:points_user]
          if data[:points_comp] < dealer_comparison_point
            dealer_hand << draw_card(deck, 'dealer')
            data[:points_comp] = calculate_points(deck, 'dealer', data)
          else
            message = "#{data[:name]} wins!"
            data[:score_user] += 1
            break
          end
        elsif data[:points_comp] == data[:points_user]
          message = "It's a tie!"
          break
        elsif data[:points_comp] > data[:cap]
          message = "Dealer busts, #{data[:name]} wins!"
          data[:score_user] += 1
          break
        else
          message = "Dealer wins!"
          data[:score_comp] += 1
          break
        end
      end
    else
      message = "#{data[:name]} busts, dealer wins!"
      data[:score_comp] += 1
    end
    show_hands(deck, dealer_hand, player_hand, data, true)
    puts
    prompt message

    if data[:score_user] == data[:nrounds]
      prompt "#{data[:name]} takes the game!"
      data[:games_user] += 1
      break
    elsif data[:score_comp] == data[:nrounds]
      prompt "What a crushing defeat...better luck next time, #{data[:name]}!"
      data[:games_comp] += 1
      break
    else
      prompt "Press enter to begin next round"
      gets
    end
    data[:round] += 1
  end

  puts
  prompt "Play again? (y/n)"
  loop do
    input = gets.chomp.downcase
    break if %w[y n].include?(input)
    prompt "Enter either 'y' or 'n'"
  end
  break if input == 'n'

  data[:game] += 1
end
prompt "Thanks for playing!"
