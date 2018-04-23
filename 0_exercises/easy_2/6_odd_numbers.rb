(1..99).each { |num| puts num if num.odd? }

puts (1..99).select { |num| num.odd? }

(1..99).step(2) { |num| puts num }