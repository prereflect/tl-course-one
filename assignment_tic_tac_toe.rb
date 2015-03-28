choices    = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
gameboard  = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]

def print_board(arr)
  puts "\n"
  puts "   #{arr[0]}   #{arr[1]}   #{arr[2]}" "\n""\n"
  puts "   #{arr[3]}   #{arr[4]}   #{arr[5]}" "\n""\n"
  puts "   #{arr[6]}   #{arr[7]}   #{arr[8]}" "\n""\n"
end

def for_the_win(arr)
  winner = [ [ arr[0], arr[1], arr[2] ],  # 1, 2, 3
             [ arr[3], arr[4], arr[5] ],  # 4, 5, 6
             [ arr[6], arr[7], arr[8] ],  # 7, 8, 9
             [ arr[0], arr[3], arr[6] ],  # 1, 4, 7
             [ arr[1], arr[4], arr[7] ],  # 2, 5, 8
             [ arr[2], arr[5], arr[8] ],  # 3, 6, 9
             [ arr[0], arr[4], arr[8] ],  # 1, 5, 9
             [ arr[2], arr[4], arr[6] ]   # 3, 5, 7
  ]
  winner.each do |spots|
    return "Computer" if spots[0] == "X" && spots.uniq.length == 1
    return "You" if spots[0] == "O" && spots.uniq.length == 1
  end
  nil
end

def announce_winner(winner)
  puts "#{winner} won!"
end

system "clear"

puts "Let\'s play Tic-Tac-Toe!"
puts "Computer will be X"
puts "You will be O"
puts "To pick your square"
puts "pick a spot from 1..9"

print_board(gameboard)
sleep(2)
gameboard.fill(".")

begin
  x_pick  = choices.shuffle!.pop.to_i - 1
  gameboard[x_pick] = "X"
  sleep(1)
  system "clear"
  puts "computer picked spot #{x_pick + 1}"
  print_board(gameboard)
  winner = for_the_win(gameboard)
  break if winner || choices.empty?

  begin
    puts "Please pick a spot"
    input = gets.chomp.to_i
  end until choices.include?(input)
  choices.delete(input)  
  y_pick = input - 1
  gameboard[y_pick] = "O"
  sleep(1)
  system "clear"
  puts "You picked spot " + input.to_s
  print_board(gameboard)
  winner = for_the_win(gameboard)
end until winner

if winner
  announce_winner(winner)
else
  puts "No Winner"
end
