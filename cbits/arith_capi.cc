#include "arith_capi.h"
#include "arith.h"

extern "C" {
  struct arith *arith_new() { return new arith(); }

  void arith_delete(arith *p) { delete p; }

  int arith_add(arith *p, int x, int y) { return p->add(x, y); }

  int arith_sub(arith *p, int x, int y) { return p->sub(x, y); }

  int arith_mult(arith *p, int x, int y) { return p->mult(x, y); }

  int arith_div(arith *p, int x, int y) { return p->div(x, y); }
}
