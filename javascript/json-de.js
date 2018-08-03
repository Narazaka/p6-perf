const json = `{
  "foo1": "bar",
  "foo2": 2,
  "foo3": [1, 2, 3],
  "foo4": null
}`;
const repeatCount = 1000000;

const start = Date.now();
for (let i = 0; i < repeatCount; ++i) {
  JSON.parse(json);
}
const end = Date.now();

console.log(end - start);
