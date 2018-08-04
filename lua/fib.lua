local n = 30
local repeatCount = 10

function fib(n)
  return n < 2 and n or fib(n - 2) + fib(n - 1)
end

local start = os.clock()
for i = 1, repeatCount do
  fib(n)
end
local _end = os.clock()

print((_end - start) * 1000)
