# № 41 — Пан-цифровое простое число.
# Будем считать n-значное число пан-цифровым, если каждая из цифр от 1 до n
# используется в нем ровно один раз. К примеру, 2143 является 4-значным
# пан-цифровым числом, а также простым числом.

# Какое существует наибольшее n-значное пан-цифровое простое число?

require 'prime'

permutations = (1..7).to_a.permutation.map(&:join)
permutations.delete_if { |p| p.to_s[-1].match /[024568]/ }

while !( Prime.prime?(permutations.max.to_i) ) do
  permutations.delete(permutations.max)
end

puts "Max: #{permutations.max}"
