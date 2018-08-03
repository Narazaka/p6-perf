const n = 40;
const repeatCount = 10000;

function fib(i) {
  return (function(i) {
    if (i == 0) return [0, 1];
    return (function(a){ return [a[1], a[1] + a[0]] })(arguments.callee(i-1));
  })(i)[0];
}

const start = Date.now();
for (let i = 0; i < repeatCount; ++i) {
  fib(n);
}
const end = Date.now();

console.log(end - start);
