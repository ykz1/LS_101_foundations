DEGREE = "\xC2\xB0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degree)
  degree %= 360 if degree < 0
  total_seconds = degree * SECONDS_PER_DEGREE
  degree, seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = seconds.divmod(SECONDS_PER_MINUTE)
  "#{degree}#{DEGREE}%02d'%02d\"" % [minutes, seconds]
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(365.34)

p dms(-76.73) # == %(-77°16'12")
p dms(-370.5)