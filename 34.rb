# № 34 — Факториалы цифр.
# 145 является любопытным числом, поскольку
# 1! + 4! + 5! = 1 + 24 + 120 = 145.

# Найдите сумму всех чисел, каждое из которых равно сумме факториалов своих цифр.

# Примечание: поскольку 1! = 1 и 2! = 2 не являются суммами, 
# учитывать их не следует.

def factorial(n)
  n = n.to_i
  n <= 1 ? 1 : n * factorial(n - 1)
end

def is_curious?(n)
  sum = 0

  n.to_s.each_char { |i| sum += factorial(i) }

  n == sum
end

range  = (3..7 * factorial(9))
result = []

range.each { |i| result << i if is_curious?(i) }

puts "Summ: #{result.reduce(:+)}"
