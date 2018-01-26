# № 25 — 1000-Значное число Фибоначчи
# Последовательность Фибоначчи определяется рекурсивным правилом:

# Fn = Fn−1 + Fn−2, где F1 = 1 и F2 = 1.
# Таким образом, первые 12 членов будут:

# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# Двенадцатый член F12 - первый член последовательности, который содержит три цифры.

# Каково значение первого члена последовательности Фибоначчи, содержащего 1000 цифр?

def fib_generator(length)
  fib_prev    = 1
  fib_current = 1
  fib_index   = 2

  while fib_current.to_s.length < length
    fib_current, fib_prev = (fib_prev + fib_current), fib_current
    fib_index += 1
  end

  fib_index
end

puts "First 1000-digits fibonacci index: #{fib_generator(1000)}"
