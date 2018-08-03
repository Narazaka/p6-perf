const n = 30;
const repeatCount = 10;

function fib(n) {
  return n < 2 ? n : fib(n - 2) + fib(n - 1);
}

const start = Date.now();
for (let i = 0; i < repeatCount; ++i) {
  fib(n);
}
const end = Date.now();

console.log(end - start);
