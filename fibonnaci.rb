#fibonnaci method

  def fibonnaci(n)
    if n < 3
      n-1
    else
    fibonnaci(n-1) + fibonnaci(n-2)
    end
  end

# prime method

  def is_prime?(num)
    if num < 0 
      false
    elsif num <= 3 || !((2..Math.sqrt(num).floor).to_a.any?{|x| num % x == 0})
      true
    else
      false
    end
  end

#p fibonnaci method
  (1..25).each do |num| 
    p fibonnaci(num)
  end

#create array for prime fibonnacis
  prime_fib_array = (1..25).to_a.map do |num| 
    fibonnaci(num)
  end

#p prime fibonnaci
  prime_fib_array.each do |num|
    p num if is_prime?(num)
  end
  
