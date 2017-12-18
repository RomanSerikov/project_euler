# № 2 — Четные числа Фибоначчи
# Каждый следующий элемент ряда Фибоначчи получается при сложении двух предыдущих. 
# Начиная с 1 и 2, первые 10 элементов будут:

# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

# Найдите сумму всех четных элементов ряда Фибоначчи, которые не превышают четыре миллиона.

limit = 4_000_000

def fib_generator(lim)
  fib_prev = 1
  fib_current = 2

  fib_numbers = [fib_prev, fib_current]

  while (fib_current < lim) do
    fib_current, fib_prev = (fib_prev + fib_current), fib_current
    fib_numbers << fib_current
  end

  fib_numbers
end

def get_even_from(arr)
  even_numbers = []

  arr.each do |a|
    even_numbers << a if a.even?
  end

  even_numbers
end


fib_numbers      = fib_generator(limit)
even_fib_numbers = get_even_from(fib_numbers)

puts even_fib_numbers.reduce(:+)
