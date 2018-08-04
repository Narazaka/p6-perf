local x = 12
local y = 6
local z = 0
local repeatCount = 5

function tarai(x, y, z)
  return x <= y and y or tarai(
    tarai(x - 1, y, z),
    tarai(y - 1, z, x),
    tarai(z - 1, x, y)
  )
end

local start = os.clock()
for i = 1, repeatCount do
  tarai(x, y, z)
end
local _end = os.clock()

print((_end - start) * 1000)
