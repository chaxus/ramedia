#include "quick_sort.cpp"
#include <emscripten/emscripten.h>

#ifdef __cplusplus
#define EXTERN extern "C"
#else
#define EXTERN
#endif

EXTERN EMSCRIPTEN_KEEPALIVE vector<int> quick_sort(vector<int> &nums) {
  QuickSort vec;
  vector<int> result = vec.sortArray(nums);
  printf("quick_sort exec");
  return result;
}