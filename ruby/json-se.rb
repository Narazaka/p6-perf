require "json"

obj = {
  foo1: "bar",
  foo2: 2,
  foo3: [1, 2, 3],
  foo4: nil,
}
repeat_count = 10000000

start = Time.now
repeat_count.times { JSON.dump(obj) }
_end = Time.now

puts ((_end - start) * 1000).to_i
