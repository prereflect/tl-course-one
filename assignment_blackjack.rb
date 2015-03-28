deck = [
  ["2 of Clubs", 2], ["3 of Clubs", 3], ["4 of Clubs", 4], ["5 of Clubs", 5], ["6 of Clubs", 6], ["7 of Clubs", 7], ["8 of Clubs", 8], ["9 of Clubs", 9], ["10 of Clubs", 10], ["Jack of Clubs", 10], ["Queen of Clubs", 10], ["King of Clubs", 10], ["Ace of Clubs", 11],
  ["2 of Diamonds", 2], ["3 of Diamonds", 3], ["4 of Diamonds", 4], ["5 of Diamonds", 5], ["6 of Diamonds", 6], ["7 of Diamonds", 7], ["8 of Diamonds", 8], ["9 of Diamonds", 9], ["10 of Diamonds", 10], ["Jack of Diamonds", 10], ["Queen of Diamonds", 10], ["King of Diamonds", 10], ["Ace of Diamonds", 11],
  ["2 of Hearts", 2], ["3 of Hearts", 3], ["4 of Hearts", 4], ["5 of Hearts", 5], ["6 of Hearts", 6], ["7 of Hearts", 7], ["8 of Hearts", 8], ["9 of Hearts", 9], ["10 of Hearts", 10], ["Jack of Hearts", 10], ["Queen of Hearts", 10], ["King of Hearts", 10], ["Ace of Hearts", 11],
  ["2 of Spades", 2], ["3 of Spades", 3], ["4 of Spades", 4], ["5 of Spades", 5], ["6 of Spades", 6], ["7 of Spades", 7], ["8 of Spades", 8], ["9 of Spades", 9], ["10 of Spades", 10], ["Jack of Spades", 10], ["Queen of Spades", 10], ["King of Spades", 10], ["Ace of Spades", 11]
]
deck  = deck * 2
game_deck = deck.shuffle

system "clear"
puts "Hello! Let\'s play some Blackjack."
puts "What\'s your name?"
input = gets.chomp
player_name = input

def deal(p_name, p_cards, p_values, d_cards, d_values, the_deck)
  p_hand = []
  d_hand = []
  p_hand << the_deck.pop
  d_hand << the_deck.pop
  p_hand << the_deck.pop
  d_hand << the_deck.pop
  p_hand.each { |card, value| p_cards << card }
  p_hand.each { |card, value| p_values << value }
  d_hand.each { |card, value| d_cards << card }
  d_hand.each { |card, value| d_values << value }
  p_total = p_values.reduce(:+)
  d_total = d_values.reduce(:+)
  system "clear"  

  case
  when p_total == 21 && d_total == 21
    puts "#{p_name}\'s cards:  #{ p_cards.join(",  ") }"
    puts "Dealer cards:  #{ d_cards.join(",  ") }"
    puts "\n""#{p_name}, it\'s a push...You both have Blackjack!"
    exit


  when p_total == 21
    puts "#{p_name}\'s cards:  #{ p_cards.join(",  ") }"
    puts "\n""Blackjack! #{p_name}. You Win!"
    exit

  when d_total == 21
    puts "Dealer cards:  #{ d_cards.join(",  ") }"
    puts "\n""Blackjack! Sorry #{p_name}, Dealer won"
    exit

  end
end


def player(p_name, p_cards, p_values, the_deck)
  begin
    p_total = p_values.reduce(:+)
    
    if p_total == 21
      system "clear"
      puts "#{p_name}\'s cards:  #{ p_cards.join(",  ") }"
      puts "Total:  #{ p_total }"
      puts "\n""21! #{p_name}. You Win!"
      exit

    elsif p_values.include?(11) && p_total > 21
      while p_values.include?(11)
        p_values.delete(11)
        p_values << 1
        p_total = p_values.reduce(:+)
      end
      next

    elsif p_total > 21
      system "clear"
      puts "cards:  #{ p_cards.join(",  ") }"
      puts "Total:  #{ p_total }"
      puts "\n""Sorry #{p_name}, You\'ve Busted! Game over"
      exit

    elsif p_total < 21
      system "clear"
      puts "#{p_name}\'s cards:  #{ p_cards.join(",  ") }"
      puts "Total:  #{ p_total }"
      begin
        puts "\n""#{p_name}, would you like to Hit or Stay? [h/s]"
        input = gets.chomp.downcase
      end until ['h', 's'].include?(input)
    end

    if ['h'].include?(input)
      new_card = []
      new_card << the_deck.pop
      new_card = new_card.flatten!
      p_cards << new_card.first
      p_values << new_card.last
    end

  end until ['s'].include?(input)
  system "clear"
end

def dealer(p_name, p_values, d_cards, d_values, the_deck)
  p_total = p_values.reduce(:+)
  d_total = d_values.reduce(:+)

  while d_total < 17
    puts "Dealer cards: #{ d_cards.join(", ") }"
    puts "Total: #{ d_total }"
    new_card = []
    new_card << the_deck.pop
    new_card = new_card.flatten!
    d_cards << new_card.first
    d_values << new_card.last
    d_total = d_values.reduce(:+)
    puts "\n""Dealer Hits"
  end

  if d_total == 21
    puts "Dealer cards: #{ d_cards.join(", ") }"
    puts "Total: #{ d_total }"
    puts "\n""21! Sorry #{p_name}, Dealer wins"
    exit

  elsif d_total < 21 && d_total > p_total
    puts "Dealer cards: #{ d_cards.join(", ") }"
    puts "Dealer: #{ d_total }   #{p_name}: #{ p_total }"
    puts "\n""Sorry #{p_name}, Dealer wins"
    exit

  elsif d_total > 21
    puts "Dealer cards: #{ d_cards.join(", ") }"
    puts "Total: #{ d_total }"
    puts "\n""Dealer busted! #{p_name} you win!"
    exit

  elsif d_total < 21 && d_total == p_total
    puts "Dealer cards: #{ d_cards.join(", ") }"
    puts "Dealer: #{ d_total }   #{p_name}: #{ p_total }"
    puts "\n""It\'s a push #{p_name}. No winner"
    exit

  else
    puts "Dealer cards: #{ d_cards.join(", ") }"
    puts "Dealer stays at: #{ d_total }   #{p_name}: #{ p_total }"
    puts "\n""#{p_name}, You win!"
  end
end

player_cards = []
player_values = []
dealer_cards = []
dealer_values = []

deal(player_name, player_cards, player_values, dealer_cards, dealer_values, game_deck)
player(player_name, player_cards, player_values, game_deck)
dealer(player_name, player_values, dealer_cards, dealer_values, game_deck)

