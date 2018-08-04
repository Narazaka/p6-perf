import times

const x = 12
const y = 6
const z = 0
const repeatCount = 5

proc tarai(x: int, y: int, z: int): int =
    if x <= y:
        y
    else:
        tarai(
            tarai(x - 1, y, z),
            tarai(y - 1, z, x),
            tarai(z - 1, x, y),
        )

let startTime = epochTime()
for i in 1..repeatCount:
    discard tarai(x, y, z)
let endTime = epochTime()

echo int((endTime - startTime) * 1000)
