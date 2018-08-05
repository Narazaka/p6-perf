import times
import strutils

const chunk = "regexp123abcbcd"
const repeatCount = 10000
const size = 1000

proc join(): void =
    discard chunk.repeat(size)

let startTime = epochTime()
for i in 1..repeatCount:
    join()
let endTime = epochTime()

echo int((endTime - startTime) * 1000)
