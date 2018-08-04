#include <iostream>
#include <chrono>
#include <vector>
using namespace std::chrono;

const int x = 12;
const int y = 6;
const int z = 0;
const int repeat_count = 5;

int tarai(int x, int y, int z) {
    return x <= y ?
    y :
    tarai(
        tarai(x - 1, y, z),
        tarai(y - 1, z, x),
        tarai(z - 1, x, y)
    );
}

int main() {
    auto start = system_clock::now();
    auto result = std::vector<int>(); // reject full optimize
    for (auto i = 0; i < repeat_count; ++i) {
        result.push_back(tarai(x, y, z));
    }
    auto end = system_clock::now();
    std::cout << duration_cast<milliseconds>(end - start).count() << std::endl;
    return 0;
}
