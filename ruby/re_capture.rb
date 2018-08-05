re = /(a(?:bc)+?)[de]$/
str = "regexp123abcbcd"
repeat_count = 1000000

start = Time.now
repeat_count.times { re.match(str) }
_end = Time.now

puts ((_end - start) * 1000).to_i
