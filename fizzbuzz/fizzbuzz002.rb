def doIT(num)
  if num % 15 == 0
    "fizzbuzz"
  elsif num % 3 == 0
   "fizz"
  elsif num % 5 == 0
    "buzz"
  else
    num
  end
end

[1,2,3,5,7,15].each do |x|
  puts "#{x}  #{doIT(x)}"
end
