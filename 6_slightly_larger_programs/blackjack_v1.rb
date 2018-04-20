require "pry"

# =============================================================================
# VARIABLES

message = ''

# =============================================================================
# METHODS

def prompt(str)
  puts "=> #{str}"
end

def initialize_deck
  dck = {}
  names = %w[Two Three Four Five Six Seven Eight Nine Ten Jack Queen King Ace]
  suites = %w[Diamonds Clubs Hearts Spades]

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

# rubocop:disable Metrics/AbcSize
def show_cards(dck, dlr, plyr, plyr_points)
  system "clear"
  puts "========================="
  prompt "Dealer showing..."
  prompt "  " + dck[dlr[0]][:name]
  prompt "  ...and an unknown card"
  puts
  prompt "Player has...#{plyr_points}"
  plyr.each do |card|
    prompt "  " + dck[card][:name] + ' ' + dck[card][:value].to_s
  end
end
# rubocop:enable Metrics/AbcSize

# rubocop:disable Metrics/AbcSize
def show_cards2(dck, dlr, plyr, plyr_points, dlr_points)
  system "clear"
  puts "========================="
  prompt "Dealer has...#{dlr_points}"
  dlr.each do |card|
    prompt "  " + dck[card][:name] + ' ' + dck[card][:value].to_s
  end
  puts
  prompt "Player has...#{plyr_points}"
  plyr.each do |card|
    prompt "  " + dck[card][:name] + ' ' + dck[card][:value].to_s
  end
end
# rubocop:enable Metrics/AbcSize

def hit?
  prompt "Hit or stay?"
  response = ''
  loop do
    response = gets.chomp.to_s.downcase[0]
    if response == 'h'
      response = true
      break
    elsif response == 's'
      response = false
      break
    else
      "Enter 'h' or 's'"
    end
  end
  response
end

def draw_card(dck, str)
  drawn = dck.select { |_, card| card[:location] == 'undealt' }.keys.sample
  dck[drawn][:location] = str
  drawn
end

def calculate_points(dck, str)
  points = 0
  dck.each do |_, card|
    if card[:location] == str
      points += card[:value]
      if card[:value] == 11 && points > 21
        card[:value] = 1
        points -= 10
      end
    end
  end

  points
end

player_points = 0

# Initialize_deck
deck = initialize_deck

# Deal initial cards
dealer_hand = deck.keys.sample(2)
deck[dealer_hand[0]][:location] = "dealer"
deck[dealer_hand[1]][:location] = "dealer"

player_hand = deck.keys.sample(2)
deck[player_hand[0]][:location] = "player"
deck[player_hand[1]][:location] = "player"

# Show cards
player_points = calculate_points(deck, 'player')
dealer_points = calculate_points(deck, 'dealer')
show_cards(deck, dealer_hand, player_hand, player_points)

# Player action
loop do
  if hit?
    player_hand << draw_card(deck, 'player')
    player_points = calculate_points(deck, 'player')
    show_cards(deck, dealer_hand, player_hand, player_points)
    show_cards(deck, dealer_hand, player_hand, player_points)
    if player_points > 21
      prompt 'Player busts!'
      break
    end
  else
    break
  end
end
if player_points <= 21
  dealer_points = calculate_points(deck, 'dealer')
  loop do
    if dealer_points < player_points
      dealer_hand << draw_card(deck, 'dealer')
      dealer_points = calculate_points(deck, 'dealer')
    elsif dealer_points == player_points
      message = "It's a tie!"
      break
    elsif dealer_points > 21
      message = 'Dealer busts, player wins!'
      break
    else
      message = "Dealer wins!"
      break
    end
  end
else
  message = "Player busts, dealer wins!"
end
show_cards2(deck, dealer_hand, player_hand, player_points, dealer_points)
puts
prompt message
