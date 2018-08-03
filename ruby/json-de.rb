require "json"

json = '{
  "foo1": "bar",
  "foo2": 2,
  "foo3": [1, 2, 3],
  "foo4": null
}';
repeat_count = 1000000

start = Time.now
repeat_count.times { JSON.parse(json) }
_end = Time.now

puts ((_end - start) * 1000).to_i
