local chunk = "regexp123abcbcd"
local repeatCount = 10000
local size = 1000

function join()
  chunks = {}
  chunks[size] = chunk
  for i = 1, size - 1 do
    chunks[i] = chunk
  end
  table.concat(chunks, "")
end

local start = os.clock()
for i = 1, repeatCount do
  join()
end
local _end = os.clock()

print((_end - start) * 1000)
