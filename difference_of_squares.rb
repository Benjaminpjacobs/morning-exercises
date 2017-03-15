def sum_of_squares(n)
  (1..n).to_a.map!{ |num| num ** 2}.inject(&:+)
end

def square_of_sum(n)
  ((1..n).to_a.inject(&:+)) ** 2
end

def difference(n)
  square_of_sum(n) - sum_of_squares(n)
end

puts difference(100)

