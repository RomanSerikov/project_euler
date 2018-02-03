# № 3 — Наибольший простой делитель
# Простые делители числа 13195 - это 5, 7, 13 и 29.

# Каков самый большой делитель числа 600851475143, являющийся простым числом?

require 'prime'

def find_divider
  number = 600_851_475_143

  (1..number).each do |i|
    next unless i.prime?
    next unless (number % i).zero?

    max_divider = i
    number /= i
    return max_divider if number == 1
  end
end

puts "Max divider: #{find_divider}"
