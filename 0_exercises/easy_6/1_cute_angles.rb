require "pry"

DEGREE = "\xC2\xB0"
SECONDS_PER_DEGREE = 60 * 60
SECONDS_PER_ROTATION = SECONDS_PER_DEGREE * 360

def dms(flt)
  degrees = flt.to_i
  minutes, seconds = ((flt % 1) * 60).round(2).divmod(1)
  seconds = (seconds * 60)
  format("%0.f%c%02.f'%02.f\"", degrees, DEGREE, minutes, seconds) # alternate
  format(%(%0.f%c%02.f'%02.f"), degrees, DEGREE, minutes, seconds)
end

def dms2(flt)
  total_seconds = (flt * SECONDS_PER_DEGREE).round.abs                              # get the absolute number of seconds we're moving from 0
  if flt < 0                                                                        # if we're moving counterclockwise...
    total_seconds = (SECONDS_PER_ROTATION - (total_seconds % SECONDS_PER_ROTATION)) # then remove full 360 degrees rotations, and subtract result from a full rotation in seconds
  end
  minutes, seconds = total_seconds.divmod(60)
  degrees, minutes = minutes.divmod(60)
  format(%(%0.f%c%02.f'%02.f"), degrees, DEGREE, minutes, seconds)
end


p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

p dms(365.34)

puts

p dms2(30) == %(30°00'00")
p dms2(76.73) == %(76°43'48")
p dms2(254.6) == %(254°36'00")
p dms2(93.034773) == %(93°02'05")
p dms2(0) == %(0°00'00")
p dms2(360) == %(360°00'00") || dms2(360) == %(0°00'00")

p dms2(365.34)

p dms2(-76.73) # == %(-77°16'12")
p dms2(-370)