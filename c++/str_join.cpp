#include <iostream>
#include <chrono>
#include <cstring>
using namespace std::chrono;

const char chunk[] = "regexp123abcbcd";
const int repeat_count = 10000;
const int size = 1000;

void join() {
    char *str = new char();
    str[0] = '\0';
    for (auto i = 0; i < size; ++i) strcat(str, chunk);
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
