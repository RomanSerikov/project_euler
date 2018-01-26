# № 44 — Пятиугольные числа.
# Пятиугольные числа вычисляются по формуле: Pn = n * (3n - 1) / 2.
# Первые десять пятиугольных чисел:

#   1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...

# Можно убедиться в том, что P4 + P7 = 22 + 70 = 92 = P8
# Однако, их разность, 70 - 22 = 48 не является пятиугольным числом.

# Найдите пару пятиугольных чисел Pj и Pk, для которых сумма и разность
# являются пятиугольными числами и значение D = |Pk - Pj| минимально,
# и дайте значение D в качестве ответа.

def make_pentagon_number(n)
  n * (3 * n - 1) / 2
end

def pentagon?(n)
  ((1 + Math.sqrt(24 * n + 1)) % 6).zero?
end

def find_pentagon
  pentagon_numbers = []

  (1..10_000).each do |i|
    pentagon_numbers << make_pentagon_number(i)
  end

  pentagon_numbers.each do |a|
    pentagon_numbers.each do |b|
      next if a <= b
      next unless pentagon?(a - b)
      next unless pentagon?(a + b)

      return a - b
    end
  end
end

puts "Diff: #{find_pentagon}"
