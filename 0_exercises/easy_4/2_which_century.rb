def century(int)
  century = int / 100
  century += 1 if int % 100 != 0
  century = century.to_s
  suffix =  if century[-2] != '1'
              case century[-1]
                when '1' then 'st'
                when '2' then 'nd'
                when '3' then 'rd'
                else 'th'
                end
            else
              'th'
            end
  century + suffix
end


p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052)  == '11th'
p century(1127)  == '12th'
p century(11201) == '113th'