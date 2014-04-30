#! /usr/bin/env ruby


def isIt(number)
  more = true

  if number % 3 == 0
    fizz = true
  elsif number % 5 == 0
    buzz = true
  end

  if number % 15 == 0
    puts "fizzbuzz"
    more = false
  end

  if more #busted in here. too tired to concentrate.
    if fizz
      puts "fizz"
    end
    if buzz
      puts "buzz"
    elsif (not fizz) or (not buzz)
      puts number
    end
  end
end

[1,2,3,4,5,6,10,15].each do |i|
  print "#{i} "
  print isIt(i).to_s
end
