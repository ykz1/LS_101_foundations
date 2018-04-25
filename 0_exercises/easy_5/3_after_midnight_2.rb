MINUTES_PER_DAY = 24 * 60
FIXED_DAY = Time.new(2018, 4, 24)

def after_midnight(t)
  hours, minutes = t.split(':').map(&:to_i)
  (hours * 60 + minutes) % MINUTES_PER_DAY
end

def before_midnight(t)
  (MINUTES_PER_DAY - after_midnight(t)) % MINUTES_PER_DAY
end

# further exploration: not-so-elegant-but-it-works alternative

def after_midnight2(t)
  hours, minutes = t.split(':').map(&:to_i)
  t = Time.new(2018, 4, 24, hours, minutes)
  ((t - FIXED_DAY) / 60) % MINUTES_PER_DAY
end

def before_midnight2(t)
  hours, minutes = t.split(':').map(&:to_i)
  t = Time.new(2018, 4, 23, hours, minutes)
  ((FIXED_DAY - t) / 60) % MINUTES_PER_DAY
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0

puts

p after_midnight2('00:00') == 0
p before_midnight2('00:00') == 0
p after_midnight2('12:34') == 754
p before_midnight2('12:34') == 686
p after_midnight2('24:00') == 0
p before_midnight2('24:00') == 0