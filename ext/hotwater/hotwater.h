#ifndef _HOTWATER_H_
#define _HOTWATER_H_

#include <stdbool.h>
#include <stdlib.h>

#ifndef MIN
  #define MIN(a, b) (((a) < (b)) ? (a) : (b))
#endif

#ifndef MAX
  #define MAX(a, b) (((a) > (b)) ? (a) : (b))
#endif

double jaro_winkler_distance(const char *str1, const char *str2, bool long_tolerance);
double jaro_distance(const char *str1, const char *str2);

int levenshtein_distance(const char *str1, const char *str2);
int damerau_levenshtein_distance(const char *str1, const char *str2);

double ngram_distance(const char *source, const char *target, int n);

#endif /* _HOTWATER_H_ */
