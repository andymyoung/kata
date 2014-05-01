def doIt(number)
  if (number % 3 == 0) && (number % 5 == 0)
    return "fizzbuzz"
  elsif (number % 3 == 0)
    return "fizz"
  elsif (number % 5 == 0)
    return "buzz"
  end
  return number
end

[1,2,3,4,5,6,10,15].each do |x|
  puts "#{x}  #{doIt(x)}"
end
