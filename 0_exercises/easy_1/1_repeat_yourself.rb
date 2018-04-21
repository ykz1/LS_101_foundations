def repeat(str, int)
  if str.is_a?(String) && int.is_a?(Integer)
    if int < 0
      puts "You can't do something a negative number of times!"
    else
      int.times { puts str }
    end
  else
    puts "Pass in valid arguments! it should be...repeat(string, integer)"
  end
end

repeat("Hello", 3)
repeat(3, "Hello")
repeat("Hello", "3")
repeat("Hello", -3)
