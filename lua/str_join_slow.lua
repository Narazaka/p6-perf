local chunk = "regexp123abcbcd"
local repeatCount = 10000
local size = 1000

function join()
  str = ""
  for i = 1, size do
    str = str .. chunk
  end
end

local start = os.clock()
for i = 1, repeatCount do
  join()
end
local _end = os.clock()

print((_end - start) * 1000)
