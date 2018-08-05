#include <iostream>
#include <chrono>
#include <string>
using namespace std::chrono;

const std::string chunkstr = "regexp123abcbcd";
const int repeat_count = 10000;
const int size = 1000;

void join() {
    std::string str = "";
    str.reserve(chunkstr.size() * size);
    for (auto i = 0; i < size; ++i) str += chunkstr;
}

int main() {
    auto start = system_clock::now();
    for (auto i = 0; i < repeat_count; ++i) {
        join();
    }
    auto end = system_clock::now();
    std::cout << duration_cast<milliseconds>(end - start).count() << std::endl;
    return 0;
}
