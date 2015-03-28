operators = [ '*', '/', '+', '-' ]

puts "give me the first number"
input_1 = gets.chomp
num1 = input_1.to_f

puts "give me the second number"
input_2 = gets.chomp
num2 = input_2.to_f

puts "How would you like to manipulate these numbers?  *  /  +  -"
operator = gets.chomp

result = num1.send(operator, num2)

puts "#{num1} #{operator} #{num2}" + " is " + "#{result.round(2)}"
