# № 56 — Максимальная сумма цифр.
# Гугол (10^100) — гигантское число: один со ста нулями;
# 100^100 почти невообразимо велико: один с двумястами нулями.
# Несмотря на их размер, сумма цифр каждого числа равна всего лишь 1.

# Рассматривая натуральные числа вида a^b, где a, b < 100, какая
# встретится максимальная сумма цифр числа?

require 'benchmark'

max_a = 100
max_b = 100

def sum_of_digits(n)
  n.to_s.each_char.reduce(0) { |sum, i| sum + i.to_i }
end

def find_max_sum(a, b)
  max = 0

  (1..a).each do |aa|
    (1..b).each do |bb|
      result = sum_of_digits(aa**bb)
      max = result if result > max
    end
  end

  max
end

puts find_max_sum(max_a, max_b)
puts "Time: #{Benchmark.realtime { find_max_sum(max_a, max_b) }.round(5)} seconds."
