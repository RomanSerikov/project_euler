# № 10 — Сложение простых чисел
# Сумма простых чисел меньше 10 - это 2 + 3 + 5 + 7 = 17.

# Найдите сумму всех простых чисел меньше двух миллионов.

require 'prime'

puts Prime.take_while { |p| p < 2_000_000 }.reduce(:+)