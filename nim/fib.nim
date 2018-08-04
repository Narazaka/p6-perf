import times

const n = 30
const repeatCount = 10

proc fib(n: int): int =
    if n < 2:
        n
    else:
        fib(n - 2) + fib(n - 1)

let startTime = epochTime()
for i in 1..repeatCount:
    discard fib(n)
let endTime = epochTime()

echo int((endTime - startTime) * 1000)
