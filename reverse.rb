def reverse(string)
  chars = string.chars
  reverse = []
  chars.each do |char, idx|
    reverse.unshift(char)
  end
  reverse.join
end
