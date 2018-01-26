# № 4 — Наибольшее произведение-палиндром.
# Число-палиндром с обеих сторон (справа налево и слева направо) читается одинаково. 
# Самое большое число-палиндром, полученное умножением двух двузначных чисел – 9009 = 91 × 99.

# Найдите самый большой палиндром, полученный умножением двух трёхзначных чисел.

require 'benchmark'

search_range = (100..999)

def palindrome?(int)
  int.to_s.reverse == int.to_s
end

def find_biggest_palindrome(range)
  max = 0

  range.each do |a|
    range.each do |b|
      next if a * b < max
      next unless palindrome?(a * b)

      max = a * b
    end
  end

  max
end

puts "Biggest 3-num palindrome: #{find_biggest_palindrome(search_range)}"
puts "Time: #{Benchmark.realtime { find_biggest_palindrome(search_range) }.round(5)} seconds."
