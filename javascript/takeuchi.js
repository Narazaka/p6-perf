const x = 12;
const y = 6;
const z = 0;
const repeatCount = 10;

function tarai(x, y, z) {
  return x <= y ?
    y :
    tarai(
      tarai(x - 1, y, z),
      tarai(y - 1, z, x),
      tarai(z - 1, x, y),
    );
}

const start = Date.now();
for (let i = 0; i < repeatCount; ++i) {
  tarai(x, y, z);
}
const end = Date.now();

console.log(end - start);
