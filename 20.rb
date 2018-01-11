# № 20 — Сумма цифр факториала
# n! означает n × (n − 1) × ... × 3 × 2 × 1

# Найдите сумму цифр в числе 100!.

sum = (1..100).reduce(:*).to_s.each_char.map(&:to_i).reduce(:+)

puts "100! digits sum is #{sum}"
