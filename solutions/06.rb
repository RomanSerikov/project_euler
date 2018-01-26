# № 6 — Разность между суммой квадратов и квадратом суммы
# Сумма квадратов первых десяти натуральных чисел
# 1^2 + 2^2 + ... + 10^2 = 385

# Квадрат суммы первых десяти натуральных чисел
# (1 + 2 + ... + 10)^2 = 55^2 = 3025

# Следовательно, разность между суммой квадратов и квадратом суммы
# первых десяти натуральных чисел составляет 3025 − 385 = 2640.

# Найдите разность между суммой квадратов и квадратом суммы первых ста натуральных чисел.

require 'benchmark'

def squares_sum(range)
  range.map { |i| i**2 }.reduce(:+)
end

def sum_squared(range)
  range.reduce(:+)**2
end

def find_diff(range)
  sum_squared(range) - squares_sum(range)
end

range = (1..100)

puts "The diff is: #{find_diff(range)}"
puts "Time: #{Benchmark.realtime { find_diff(range) }.round(5)} seconds."
