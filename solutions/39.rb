# № 39 — Целые прямоугольные треугольники
# Если p — периметр прямоугольного треугольника с целочисленными длинами
# сторон {a, b, c}, то существует ровно три решения для p = 120:

#   {20, 48, 52}, {24, 45, 51}, {30, 40, 50}

# Какое значение p <= 1000 дает максимальное число решений?

require 'benchmark'

def largest_hash_key(hash)
  hash.max_by { |_k, v| v }
end

def perimeter_with_max_solutions(limit)
  max_perimeter = limit
  m_range = (1..23)
  n_range = (1..23)
  k_range = (1..max_perimeter)
  tr_hash = {}
  res_hash = Hash.new(0)

  m_range.each do |m|
    n_range.each do |n|
      k_range.each do |k|
      
        next if n > m

        a = k * (m**2 - n**2)
        next if a.zero?

        b = k * (2 * m * n)
        c = k * (m**2 + n**2)

        a, b = b, a if a > b 

        perimeter = a + b + c
        next if perimeter > max_perimeter

        tr_hash["#{a}#{b}#{c}"] = perimeter
      end 
    end
  end

  tr_hash.each_value { |value| res_hash[value] += 1 }

  largest_hash_key(res_hash)
end

puts "Answer: #{perimeter_with_max_solutions(1000)}"
puts "Time: #{Benchmark.realtime { perimeter_with_max_solutions(1000) }.round(5)} seconds."
