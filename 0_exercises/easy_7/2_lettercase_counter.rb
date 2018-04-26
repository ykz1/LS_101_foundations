# 2_lettercase_counter.rb
# Begin 11:47AM
# Finish1 12:00PM
# Finish 2 12:08PM  
# ---
# take 1 string argument
# return hash with 3 elements: # lowercase chars, # uppercase chars, # chars that are neither

def letter_case_count(str)
  hsh = { lowercase: 0,
          uppercase: 0,
          neither: 0 }
  str.chars.each do |char|
    if char.ord >= 'a'.ord && char.ord <= 'z'.ord
      hsh[:lowercase] += 1
    elsif char.ord >= 'A'.ord && char.ord <= 'Z'.ord
      hsh[:uppercase] += 1
    else
      hsh[:neither] += 1
    end
  end
  hsh
end

def letter_case_count2(str)
  hsh = {}
  charas = str.chars
  hsh[:lowercase] = charas.count{ |char| char =~ /[a-z]/}
  hsh[:uppercase] = charas.count{ |char| char =~ /[A-Z]/}
  hsh[:neither] = charas.count{ |char| char =~ /[^a-zA-Z]/}
  hsh
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

p letter_case_count2('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count2('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count2('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count2('') == { lowercase: 0, uppercase: 0, neither: 0 }