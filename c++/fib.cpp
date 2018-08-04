#include <iostream>
#include <chrono>
#include <vector>
using namespace std::chrono;

const int n = 30;
const int repeat_count = 10;

int fib(int n) {
  return n < 2 ? n : fib(n - 2) + fib(n - 1);
}

int main() {
    auto start = system_clock::now();
    auto result = std::vector<int>(); // reject full optimize
    for (auto i = 0; i < repeat_count; ++i) {
        result.push_back(fib(n));
    }
    auto end = system_clock::now();
    std::cout << duration_cast<milliseconds>(end - start).count() << std::endl;
    return 0;
}
