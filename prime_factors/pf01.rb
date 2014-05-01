#!/usr/bin/env ruby
# encoding: utf-8
require 'pry'

def isPrime(number) # This works
  prime = true
  index = 2
  (number - 2).times do
    if number.to_i % index == 0
      prime = false
    end
    index += 1
  end
  prime
end

def getPrimeFactors(number) # This doesn't, and I'm too tired to think about recursion
  index = 1

  prime_factors = []
  (number / 2).times do
    factors = []
    if number % index == 0
      if (isPrime(number/index)) && (isPrime(index))
        factors = [number/index,index]
        prime_factors << factors
      end
    end
  end
  prime_factors
end

[1,3,5, 6, 9, 11, 211].each do |x|
  #puts "#{x} is prime? #{isPrime(x)}"
  puts "#{x} prime factors: #{getPrimeFactors(x)}"
end

