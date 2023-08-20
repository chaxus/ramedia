#include <emscripten/bind.h>

float lerp(float a, float b, float t) {
    return (1 - t) * a + t * b;
}

EMSCRIPTEN_BINDINGS(my_module) {
    emscripten::function("lerp", &lerp);
}