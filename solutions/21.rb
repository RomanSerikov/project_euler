# № 21 — Дружественные числа
# Пусть d(n) определяется как сумма делителей n (числа меньше n, делящие n нацело).
# Если d(a) = b и d(b) = a, где a ≠ b, то a и b называются дружественной парой,
# а каждое из чисел a и b - дружественным числом.

# Например, делителями числа 220 являются 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 и 110,
# поэтому d(220) = 284. Делители 284 - 1, 2, 4, 71, 142, поэтому d(284) = 220.

# Подсчитайте сумму всех дружественных чисел меньше 10000.

require 'benchmark'

def dividors(n)
  (1..n / 2).select { |i| (n % i).zero? }
end

def friendly?(n)
  d_n = dividors(n).reduce(:+)
  b = dividors(d_n).reduce(:+)
  b == n && d_n != n
end

def sum_friendly
  range = (2...10_000)
  nums = []

  range.each do |i|
    nums << i if friendly?(i)
  end

  nums.reduce(:+)
end

puts sum_friendly
puts "Time: #{Benchmark.realtime { sum_friendly }.round(5)} seconds."
