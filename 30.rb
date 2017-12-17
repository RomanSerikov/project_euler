# № 30 — Пятые степени цифр.
# Удивительно, но существует только три числа, которые могут быть записаны в виде
# суммы четвертых степеней их цифр:

# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4

# 1 = 1^4 не считается, так как это — не сумма.

# Сумма этих чисел равна 1634 + 8202 + 9474 = 19316.

# Найдите сумму всех чисел, которые могут быть записаны в виде суммы пятых
# степеней их цифр.

limit = 1_000_000
range = (2..limit)
magic_numbers = []

puts "The numbers are:"

range.each do |number|
  if ( number.to_s.each_char.reduce(0) { |sum, char| sum + (char.to_i ** 5) } ) == number
    puts number
    magic_numbers << number
  end
end

puts "The sum is #{magic_numbers.reduce(:+)}"