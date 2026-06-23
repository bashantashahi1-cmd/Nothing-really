#pragma once
#include <stdlib.h>

float GetJitter(float baseValue) {
    // 0.8 to 1.2 multiplier for organic-feeling recoil
    float variation = 0.8f + static_cast<float>(rand()) / (static_cast<float>(RAND_BUFFER/0.4f));
    return baseValue * variation;
}
