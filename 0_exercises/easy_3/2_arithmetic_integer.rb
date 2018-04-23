print "Enter the first number: "
num1 = gets.chomp.to_f
print "Enter the second number: "
num2 = gets.chomp.to_f

ops = %w(+ - * / % **)

puts

ops.each do |op|
  next if num2 == 0 && (op == '/' || op == '%')
  output = [num1, num2].inject(op.to_sym)
  puts "#{num1} #{op} #{num2} = #{format("%.1f", output)}"
end
