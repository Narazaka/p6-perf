local re = "a(?:bc)+?[de]$"
local str = "regexp123abcbcd"
local repeatCount = 1000000

local start = os.clock()
for i = 1, repeatCount do
  str:find(re)
end
local _end = os.clock()

print((_end - start) * 1000)
