#pragma once

struct arith {
  arith() noexcept;

  int add(int x, int y) noexcept;
  int sub(int x, int y) noexcept;
  int mult(int x, int y) noexcept;
  int div(int x, int y) noexcept;
};
