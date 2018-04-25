MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
FIXED_MIDNIGHT = Time.new(2018, 4, 22)
WDAYS = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']

def time_of_day(int)
  int, minutes = int.divmod(MINUTES_PER_HOUR)
  int, hours = int.divmod(HOURS_PER_DAY)
  "#{format("%02d", hours)}:#{format("%02d", minutes)}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"

def time_of_day2(int)
  t = FIXED_MIDNIGHT + (int * 60)
  WDAYS[t.wday] + ' ' + format("%02d:%02d", t.hour, t.min)
end

puts

p time_of_day2(0) # == "00:00"
p time_of_day2(-3) # == "23:57"
p time_of_day2(35) # == "00:35"
p time_of_day2(-1437) # == "00:03"
p time_of_day2(3000) # == "02:00"
p time_of_day2(800) # == "13:20"
p time_of_day2(-4231) # == "01:29"