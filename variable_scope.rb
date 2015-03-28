people = [ "him", "her", "them", "us", "him", "her", "them", "us" ]

def change(x)
  p x.uniq
  p x.uniq!
  p @inside = x * 2
  p local = x
end

p change(people)

p @inside
p people
# p local =>  variable_scope.rb:13:in `<main>': undefined local variable or method `local' for main:Object (NameError)
