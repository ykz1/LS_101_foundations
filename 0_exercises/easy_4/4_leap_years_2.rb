def leap_year?(int)
  int % 400 == 0 || (int % 4 == 0) && (int % 100 != 0)
end

def leap_year_v2?(int)
  int % 4 == 0 && (int < 1752 || int % 400 == 0 || int % 100 != 0)
end

p leap_year_v2?(2016) == true
p leap_year_v2?(2015) == false
p leap_year_v2?(2100) == false
p leap_year_v2?(2400) == true
p leap_year_v2?(240000) == true
p leap_year_v2?(240001) == false
p leap_year_v2?(2000) == true
p leap_year_v2?(1900) == false
p leap_year_v2?(1752) == true
p leap_year_v2?(1700) == true
p leap_year_v2?(1) == false
p leap_year_v2?(100) == true
p leap_year_v2?(400) == true