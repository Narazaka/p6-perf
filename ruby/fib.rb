n = 30
repeat_count = 10

def fib(n)
  n < 2 ? n : fib(n - 2) + fib(n - 1)
end

start = Time.now
repeat_count.times { fib(n) }
_end = Time.now

puts ((_end - start) * 1000).to_i
