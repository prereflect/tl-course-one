numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]

def shuffly(arr)
  p arr             # p arr
  p arr.shuffle     # new array shuffled
  arr.shuffle!      # shuffle arr
end

shuffly(numbers)
p numbers           # p numbers from .shuffle!
p numbers.shuffle!  # p numbers shuffled again!
