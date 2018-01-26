# № 9 — Особая тройка Пифагора
# Тройка Пифагора - три натуральных числа a < b < c, для которых выполняется равенство
# a^2 + b^2 = c^2

# Например, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# Существует только одна тройка Пифагора, для которой a + b + c = 1000.
# Найдите произведение abc.

require 'benchmark'

def pifagor_triple
  (1..1000).each do |a|
    (1..1000 - a).each do |b|
      next unless b > a

      c = 1000 - a - b
      next unless c > b
      next unless a * a + b * b == c * c

      return "#{a} * #{b} * #{c} = #{a * b * c}"
    end
  end
end

puts pifagor_triple
puts "Time: #{Benchmark.realtime { pifagor_triple }.round(5)} seconds."
