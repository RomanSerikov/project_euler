# № 23 — Неизбыточные суммы
# Идеальным числом называется число, у которого сумма его делителей равна самому числу.
# Например, сумма делителей числа 28 равна 1 + 2 + 4 + 7 + 14 = 28, что означает,
# что число 28 является идеальным числом.

# Число n называется недостаточным, если сумма его делителей меньше n,
# и называется избыточным, если сумма его делителей больше n.

# Так как число 12 является наименьшим избыточным числом (1 + 2 + 3 + 4 + 6 = 16),
# наименьшее число, которое может быть записано как сумма двух избыточных чисел, равно 24.
# Используя математический анализ, можно показать, что все целые числа больше 28123
# могут быть записаны как сумма двух избыточных чисел. 
# Эта граница не может быть уменьшена дальнейшим анализом, даже несмотря на то,
# что наибольшее число, которое не может быть записано как сумма двух избыточных чисел,
# меньше этой границы.

# Найдите сумму всех положительных чисел,
# которые не могут быть записаны как сумма двух избыточных чисел.

require 'benchmark'

def divisors(n)
  1.upto(Math.sqrt(n)).select { |i| (n % i).zero? }.each_with_object([]) do |i, divisors|
    divisors << i
    divisors << n / i if i != n / i && i != 1
  end
end

def abundant?(n)
  divisors(n).reduce(:+) > n
end

def abundant(limit)
  (12...limit).select { |i| abundant?(i) }
end

def sum_abundant
  abundant_numbers = abundant(28_123)
  abundant_sums = []

  abundant_numbers.each do |num1|
    abundant_numbers.each do |num2|
      sum = num1 + num2
      break if sum > 28_123
      abundant_sums << sum
    end
  end

  abundant_sums
end

def sum_non_abundant
  ((1..28_123).to_a - sum_abundant).reduce(:+)
end

puts sum_non_abundant
puts "Time: #{Benchmark.realtime { sum_non_abundant }.round(5)} seconds."
