# № 42 — Закодированные треугольные числа.
# n-ый член последовательности треугольных чисел задается как:

#   tn = 1/2 * n * (n + 1)

# Таким образом, первые десять треугольных чисел:
  
#   1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Преобразовывая каждую букву в число, соответствующее ее порядковому номеру
# в алфавите, и складывая эти значения, мы получим числовое значение слово
# SKY равно 19 + 11 + 25 = 55 = t10. Если числовое значение слова является
# треугольным числом, то мы назовем это слово треугольным словом.

# Используя words.txt, содержащий около двух тысяч часто используемых
# английских слов, определите сколько в нем треугольных слов.

def string_to_num(string)
  string.sum - string.size * 96
end

def triangle?(n)
  ((1 - Math.sqrt(8 * n + 1)) % 2).zero?
end

words = IO.read('../files/p042_words.txt').split(",").map { |word| word[1..-2].downcase }
puts words.select { |word| triangle?(string_to_num(word)) }.size
