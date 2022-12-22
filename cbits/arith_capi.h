#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct arith arith;

extern arith *arith_new();

extern void arith_delete(arith *p);

extern int arith_add(arith *p, int x, int y);
extern int arith_sub(arith *p, int x, int y);
extern int arith_mult(arith *p, int x, int y);
extern int arith_div(arith *p, int x, int y);

#ifdef __cplusplus
}
#endif
