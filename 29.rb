# № 29 — Различные степени.
# Рассмотрим все целочисленные комбинации a^b для 2 <= a <= 5 и 2 <= b <= 5:
#
# 2^2 = 4,  2^3 = 8,   2^4 = 16,  2^5 = 32
# 3^2 = 9,  3^3 = 27,  3^4 = 81,  3^5 = 243
# 4^2 = 16, 4^3 = 64,  4^4 = 256, 4^5 = 1024
# 5^2 = 25, 5^3 = 125, 5^4 = 625, 5^5 = 3125
#
# Если их расположить в порядке возрастания, исключив повторения, мы получим
# следующую последовательность из 15 различных членов:
#
# 4, 8, 9, 16, 25, 27, 32, 64, 81, 125, 243, 256, 625, 1024, 3125
#
# Сколько различных членов имеет последовательность a^b 
# для 2 <= a <= 100 и 2 <= b <= 100?

base   = 2..100
pow    = 2..100
result = []

base.each do |a|
  pow.each { |b| result << a ** b } 
end

puts result.uniq.size
