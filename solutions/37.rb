# № 37 — Укорачиваемые простые числа
# Число 3797 обладает интересным свойством. Будучи само по себе простым числом,
# из него можно последовательно выбрасывать цифры слева направо, число же при
# этом остается простым на каждом этапе: 3797, 797, 97, 7.

# Точно таким же способом можно выбрасывать цифры справа налево: 3797, 379, 37, 3.

# Найдите сумму единственных одиннадцати простых чисел, из которых можно выбрасывать
# цифры как справа налево, так и слева направо, но числа при этом остаются простыми.

# Примечание: числа 2, 3, 5 и 7 таковыми не считаются.

require 'prime'
require 'benchmark'

def left_prime?(number)
  string = number.to_s

  while string.size > 1
    string = string[1..-1]
    return false unless Prime.prime?(string.to_i)
  end

  true
end

def right_prime?(number)
  string = number.to_s

  while string.size > 1
    string = string.chop
    return false unless Prime.prime?(string.to_i)
  end
  
  true
end

def short_primes_sum
  range = (10..1_000_000)
  prime_array = [23, 53]

  range.each do |i|
    next if i.to_s =~ /[245680]/
    next unless Prime.prime?(i)
    next unless left_prime?(i)
    next unless right_prime?(i)

    prime_array << i
  end

  prime_array.reduce(:+)
end

puts "Sum: #{short_primes_sum}"
puts "Time: #{Benchmark.realtime { short_primes_sum }.round(5)} seconds."
