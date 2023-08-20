#include "quick_sort.cpp"
#include "ccall.cpp"
#include "embind.cpp"

int main()
{
    vector<int> array{2, 3, 54, 43, 234, 1, 43};
    array = quick_sort(array);
    string str = vectorIntToString(array);
    cout << str << endl;
    return 0;
}

EMSCRIPTEN_BINDINGS(my_class_example) {
  emscripten::class_<QuickSort>("QuickSort")
    .function("sortArray", &QuickSort::sortArray);
}
