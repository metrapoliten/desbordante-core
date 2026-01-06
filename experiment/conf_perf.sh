#!/bin/bash

ITERATIONS=500
CPU=15
OUTPUT_FILE="experiment/conf_without_perf"

PRE="rm -rf build"
RUN="cmake -S . -B build -DCOMPILE_BENCHMARKS=ON -DPYTHON=COMPILE -DCMAKE_BUILD_TYPE=Debug -G Ninja"

times=()

echo "Starting $ITERATIONS iterations on core $CPU..."

sudo -v

sudo systemctl set-property --runtime -- init.scope AllowedCPUs=0-14
sudo systemctl set-property --runtime -- system.slice AllowedCPUs=0-14

for ((i=1; i<=ITERATIONS; i++)); do
    eval "$PRE" > /dev/null 2>&1
    echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null
    sync
    
    result=$(perf stat -x, -e duration_time -- taskset -c 15 $RUN 2>&1)
    exec_time=$(echo "$result" | tail -n 1 | cut -d, -f1)
    exec_time=$(printf "%010d" "$exec_time" | sed -E 's/(.*)(.{9})/\1.\2/; s/0+$//; s/\.$//')   
    times+=("$exec_time")

    echo "Iteration $i/$ITERATIONS: $exec_time sec"
done

echo "PRE=$PRE"
echo "RUN=$RUN"
echo "${times[@]}" > "$OUTPUT_FILE"
echo "Done. Times saved to $OUTPUT_FILE"
