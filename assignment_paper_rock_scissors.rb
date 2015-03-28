ITEMS = [ "rock", "paper", "scissors" ]

scenario = { rock: { rock:     "Tied!",
                     paper:    "Paper smothers Rock!",
                     scissors: "Rock crushes Scissors!"
             },
          
             paper: { rock:     "Paper smothers Rock!",
                      paper:    "Tied!",
                      scissors: "Scissors cut Paper!"
             },
          
             scissors: { rock:     "Rock crushes Scissors!",
                         paper:    "Scissors cut Paper!",
                         scissors: "Tied!"
             }
}

puts 'Let\'s play "Rock-Paper-Scissors"!'

loop do
  begin
    puts "Type rock/paper/scissors"
    input = gets.chomp.downcase
  end until ITEMS.include?(input)

  human = input.to_sym
  computer = ITEMS.sample.to_sym

  puts "You picked #{human.capitalize}"
  puts "Computer picked #{computer.capitalize}"

  puts scenario[human][computer]

  begin
    puts "Play again? y/n"
    play_again = gets.chomp.downcase
  end until play_again.eql?("y") || play_again.eql?("n")

  break if play_again != "y"
end

puts "Thanks for playing!"
