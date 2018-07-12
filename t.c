#include <stdio.h>

#include "sb.h"

int main(int argc, char *argv[]) {
  sb_t *b = sb_new(0);
  for (int i = 0; i < 10; i++) {
    sb_append_char(b, '0' + i);
  }
  char *s = sb_build(b);
  printf("%s\n", s);
  free(s);
  return 0;
}
