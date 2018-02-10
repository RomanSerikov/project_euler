# № 12 — Треугольное число с большим количеством делителей
# Последовательность треугольных чисел образуется путем сложения натуральных чисел.
# К примеру, 7-ое треугольное число будет 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.

# Первые десять треугольных чисел:
# 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Перечислим делители первых семи треугольных чисел:
#  1: 1
#  3: 1,3
#  6: 1,2,3,6
# 10: 1,2,5,10
# 15: 1,3,5,15
# 21: 1,3,7,21
# 28: 1,2,4,7,14,28
# Как мы видим, 28 - первое треугольное число, у которого более пяти делителей.

# Каково первое треугольное число, у которого более пятисот делителей?

require 'prime'
require 'benchmark'

def divisors(num)
  num.prime_division.reduce(1) { |prod, n| prod * (n[1] + 1) } 
end

def triangular(n)
  n * (n + 1) / 2
end

def find_triangle_with(count)
  i = 1

  loop do
    n = triangular(i)
    return n if divisors(n) > count
    i += 1
  end
end

puts find_triangle_with(500)
puts "Time: #{Benchmark.realtime { find_triangle_with(500) }.round(5)} seconds."
