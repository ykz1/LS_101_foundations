# 8_fib_recursive.rb

# Start     3:29 PM
# End       3:33 PM

# 

def fibonacci_caveman(int)
  int > 2 ? fibonacci(int - 1) + fibonacci(int - 2) : 1
end


def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765
a = Time.now.sec
p fibonacci_caveman(8000)
puts (Time.now.sec - a)
a = Time.now.sec
p fibonacci(8000)
puts (Time.now.sec - a)
