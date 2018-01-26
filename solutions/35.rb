# № 35 — Круговые простые числа
# Число 197 называется круговым простым числом, 
# потому что все перестановки его цифр с конца в начало являются простыми числами: 
# 197, 719 и 971.

# Существует тринадцать таких простых чисел меньше 100:
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79 и 97.

# Сколько существует круговых простых чисел меньше миллиона?

require 'prime'
require 'benchmark'

def round_simple?(n)
  n = n.to_s

  n.size.times do
    return false unless Prime.prime?(n.to_i)
    n = "#{n[1..-1]}#{n[0]}" 
  end

  true
end

def count_rounds(limit)
  primes = Prime.take_while { |p| p < limit }
  rounds = 0

  primes.each do |p|
    rounds += 1 if round_simple?(p)
  end

  rounds
end

limit = 1_000_000

puts "Simple primes below #{limit}: #{count_rounds(limit)}"
puts "Time: #{Benchmark.realtime { count_rounds(limit) }.round(5)} seconds."
