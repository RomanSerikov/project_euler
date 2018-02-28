# № 21 — Дружественные числа
# Пусть d(n) определяется как сумма делителей n (числа меньше n, делящие n нацело).
# Если d(a) = b и d(b) = a, где a ≠ b, то a и b называются дружественной парой,
# а каждое из чисел a и b - дружественным числом.

# Например, делителями числа 220 являются 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 и 110,
# поэтому d(220) = 284. Делители 284 - 1, 2, 4, 71, 142, поэтому d(284) = 220.

# Подсчитайте сумму всех дружественных чисел меньше 10000.

require 'benchmark'

def divisors(n)
  2.upto(Math.sqrt(n)).select { |i| (n % i).zero? }.each_with_object([]) do |i, divisors|
    divisors << i
    divisors << n / i unless i == n / i
  end
end

def friendly?(a)
  b = divisors(a).reduce(1, :+)
  a_test = divisors(b).reduce(1, :+)
  a_test == a && a != b
end

def sum_friendly
  (2...10_000).select { |i| friendly?(i) }.reduce(:+)
end

puts sum_friendly
puts "Time: #{Benchmark.realtime { sum_friendly }.round(5)} seconds."
