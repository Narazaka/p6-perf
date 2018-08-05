const chunk = "regexp123abcbcd";
const repeatCount = 10000;
const size = 1000;

function join() {
    let str = "";
    for (let j = 0; j < size; ++j) str += chunk;
}

const start = Date.now();
for (let i = 0; i < repeatCount; ++i) {
    join();
}
const end = Date.now();

console.log(end - start);
