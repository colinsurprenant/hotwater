/* 
Colin Surprenant, Feb 2013
- converted in C from org/apache/lucene/search/spell/NGramDistance.java v4.0.0
- fixed segfault bug in call to substring for n parameter, which did not surface in Java
*/

/* package org.apache.lucene.search.spell; */

/**
* Licensed to the Apache Software Foundation (ASF) under one or more
* contributor license agreements.  See the NOTICE file distributed with
* this work for additional information regarding copyright ownership.
* The ASF licenses this file to You under the Apache License, Version 2.0
* (the "License"); you may not use this file except in compliance with
* the License.  You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

/**
 * N-Gram version of edit distance based on paper by Grzegorz Kondrak, 
 * "N-gram similarity and distance". Proceedings of the Twelfth International 
 * Conference on String Processing and Information Retrieval (SPIRE 2005), pp. 115-126, 
 * Buenos Aires, Argentina, November 2005. 
 * http://www.cs.ualberta.ca/~kondrak/papers/spire05.pdf
 * 
 * This implementation uses the position-based optimization to compute partial
 * matches of n-gram sub-strings and adds a null-character prefix of size n-1 
 * so that the first character is contained in the same number of n-grams as 
 * a middle character.  Null-character prefix matches are discounted so that 
 * strings with no matching characters will return a distance of 0.
 * 
 */

#include "hotwater.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

char* substring(const char* s, int offset, int n) {
  if (s == 0 || strlen(s) == 0 || strlen(s) < offset || strlen(s) < (offset + n)) {
    return 0;    
  }
  return strndup(s + offset, n);
}

double ngram_distance (const char *source, const char *target, int n) {
  int sl = strlen(source);
  int tl = strlen(target);
    
  if (sl == 0 || tl == 0) {
    if (sl == tl) {
      return 1;
    }
    else {
      return 0;
    }
  }

  int cost = 0;
  if (sl < n || tl < n) {
    int ni = MIN(sl, tl);
    int i;
    for (i = 0; i < ni; i++) {
      if (source[i] == target[i]) {
        cost++;
      }
    }
    return (double)cost / (double)MAX(sl, tl);
  }

  int sa_len = sl + n - 1;
  char* sa = calloc(sa_len + 1, sizeof(char));
  if (!sa) {
    return -1;
  }

  double* p; // 'previous' cost array, horizontally
  double* d; // cost array, horizontally
  double* _d; // placeholder to assist in swapping p and d
  
  // construct sa with prefix
  int i;
  for (i = 0; i < sa_len; i++) {
    if (i < n - 1) {
      sa[i] = 0 ; //add prefix
    }
    else {
      sa[i] = source[i - n + 1];
    }
  }

  int p_d_len = sl + 1;
  p = calloc(p_d_len + 1, sizeof(double)); 
  if (!p) {
    free(sa);
    return -1;
  }
  d = calloc(p_d_len + 1, sizeof(double)); 
  if (!d) {
    free(sa);
    free(p);
    return -1;
  }
  
  // indexes into strings s and t
  i = 0; // iterates through source
  int j = 0; // iterates through target
  
  char* t_j = calloc(n + 1, sizeof(char)); // jth n-gram of t
  if (!t_j) {
    free(sa);
    free(p);
    free(d);
    return -1;
  }
  for (i = 0; i <= sl; i++) {
    p[i] = i;
  }
  
  for (j = 1; j <= tl; j++) {
    // construct t_j n-gram 
    if (j < n) {
      int ti;
      for (ti = 0; ti < n - j; ti++) {
        t_j[ti] = 0; //add prefix
      }
      for (ti = n - j; ti < n; ti++) {
         t_j[ti] = target[ti - (n - j)];
      }
    }
    else {
      free(t_j);
      t_j = substring(target, j - n, n);
    }
    d[0] = j;
    for (i = 1; i <= sl; i++) {
      cost = 0;
      int tn = n;
      // compare sa to t_j

      int ni;
      for (ni = 0; ni < n; ni++) {
        if (sa[i - 1 + ni] != t_j[ni]) {
          cost++;
        }
        else if (sa[i - 1 + ni] == 0) { //discount matches on prefix
          tn--;
        }
      }
      double ec = (double)cost / (double)tn;

      // minimum of cell to the left+1, to the top+1, diagonally left and up +cost
      d[i] = MIN(MIN(d[i - 1] + 1, p[i] + 1), p[i - 1] + ec);
    }
    // copy current distance counts to 'previous row' distance counts
    _d = p;
    p = d;
    d = _d;
  }
  double p_sl = p[sl];

  free(p);
  free(d);
  free(t_j);
  free(sa);

  // our last action in the above loop was to switch d and p, so p now
  // actually has the most recent cost counts
  return 1.0 - (p_sl / (double)MAX(tl, sl));
}
