#pragma once

#include <pebble.h>

#include "../window/window.h"

void health_init();

bool health_is_available();

int health_get_metric_sum(HealthMetric metric);
