#!/bin/sh

echo 1 | tee /sys/devices/system/cpu/cpu*/cpuidle/state1/disable >/dev/null
echo 1 | tee /sys/devices/system/cpu/cpu*/cpuidle/state2/disable >/dev/null
echo 1 | tee /sys/devices/system/cpu/cpu*/cpuidle/state3/disable >/dev/null

echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo

cat /sys/devices/system/cpu/cpufreq/policy*/scaling_cur_freq