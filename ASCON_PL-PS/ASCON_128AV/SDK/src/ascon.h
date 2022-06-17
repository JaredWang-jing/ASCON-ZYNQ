#ifndef ASCON_H_
#define ASCON_H_

#include <stdint.h>

typedef struct {
  uint64_t x0, x1, x2, x3, x4;
} state_t;

typedef struct {
  uint32_t p0, p1, p2, p3, p4, p5, p6, p7;
} state_p;

typedef struct {
  uint32_t ct0, ct1, ct2, ct3, ct4, ct5, ct6, ct7,ct8,ct9,ct10,ct11;
} state_ct;


#endif /* ASCON_H */
