x = 12
y = 6
z = 0
repeat_count = 10

def tarai(x, y, z)
  if x <= y
    y
  else
    tarai(
      tarai(x - 1, y, z),
      tarai(y - 1, z, x),
      tarai(z - 1, x, y),
    )
  end
end

start = Time.now
repeat_count.times { tarai(x, y, z) }
_end = Time.now

puts ((_end - start) * 1000).to_i
