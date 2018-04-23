a = 050
b = 0500
c = 05000

a_str = '0%o' % a

def oct_to_str(oct, num_trailing_0s = 1)
  "#{0 * num_trailing_0s}%o" % oct
end

def is_octal?(oct)
  output = false
  10.times do |trailing_0s|
    int = oct_to_str(oct, trailing_0s).to_i
    how_many_power_10(int).times { int = int / 10 * 8 }
    output = true if int == oct
  end
  output
end

def how_many_power_10(int)
  power = 0
  loop do
    if int / 10 > 0
      int /= 10
      power += 1
    else
      break
    end
  end
  power
end

p oct_to_str(09)
p oct_to_str(b)
p oct_to_str(c)
p
p a
p b
p c
p
p how_many_power_10(50)
p how_many_power_10(500)
p how_many_power_10(123123)
p is_octal?(5)
p is_octal?(05)
p is_octal?(050)
p is_octal?(0500)
p is_octal?(005)
p is_octal?(0050)
p is_octal?(00500)
