# № 17 — Счет букв в числительных

# Если записать числа от 1 до 5 английскими словами (one, two, three, four, five),
# то используется 3 + 3 + 5 + 4 + 4 = 19 букв.

# Сколько букв понадобится для записи всех чисел от 1 до 1000 (one thousand) включительно?

# Примечание: Не считайте пробелы и дефисы. Например, число 342 (three hundred and forty-two)
# состоит из 23 букв, число 115 (one hundred and fifteen) - из 20 букв.
# Использование "and" при записи чисел соответствует правилам британского английского.

NUMERALS = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety',
  100 => 'hundred',
  1000 => 'one thousand'
}.freeze

def construct_hundreds(n)
  tail = (n % 100).zero? ? "" : " and "
  "#{NUMERALS[n / 100]} hundred#{tail}"
end

def construct_tens(n)
  tens = n / 10
  n %= 10
  tail = n.zero? ? "" : "-#{NUMERALS[n]}"
  "#{NUMERALS[tens * 10]}#{tail}"
end

def convert_to_word(n)
  answer = ""

  if (100..999).cover?(n)
    answer << construct_hundreds(n)
    n %= 100
  end
  
  answer << construct_tens(n) if (21..99).cover?(n)
  answer << NUMERALS[n] if (1..20).cover?(n) || n == 1000

  answer
end

def count_letters
  (1..1000).map { |i| convert_to_word(i).gsub(/-|\s+/, "").size }.reduce(:+)
end

puts count_letters
