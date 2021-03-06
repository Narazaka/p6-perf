chunk = "regexp123abcbcd"
repeat_count = 10000
size = 1000

def join(size, chunk)
  str = ""
  size.times { str += chunk }
end

start = Time.now
repeat_count.times { join(size, chunk) }
_end = Time.now

puts ((_end - start) * 1000).to_i
