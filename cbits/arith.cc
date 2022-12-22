#include "arith.h"

arith::arith() noexcept {}

int arith::add(int x, int y) noexcept { return x + y; }
int arith::sub(int x, int y) noexcept { return x - y; }
int arith::mult(int x, int y) noexcept { return x * y; }
int arith::div(int x, int y) noexcept { return x / y; }
