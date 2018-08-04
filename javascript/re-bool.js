const re = /a(?:bc)+?[de]$/;
const str = "regexp123abcbcd";
const repeatCount = 1000000;

const start = Date.now();
for (let i = 0; i < repeatCount; ++i) {
  re.test(str);
}
const end = Date.now();

console.log(end - start);
