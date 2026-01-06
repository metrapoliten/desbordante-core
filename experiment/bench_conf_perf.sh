#!/usr/bin/env bash

# Configuration
RUNS=500
OUTPUT_FILE="experiment/configure_without_changes_perf.json"
BUILD_DIR="build"
PREPARE_CMD="rm -rf ${BUILD_DIR}; sync; echo 3 | sudo tee /proc/sys/vm/drop_caches"
# The command to benchmark
CMD="cmake -S . -B $BUILD_DIR -DCOMPILE_BENCHMARKS=ON -DPYTHON=COMPILE -DCMAKE_BUILD_TYPE=Debug -G Ninja"

# Ensure the experiment directory exists
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Check for sudo access upfront (for dropping caches)
echo "This script requires sudo privileges to drop caches."
sudo -v

# Initialize the JSON array in the file
echo -n "[" > "$OUTPUT_FILE"

echo "Starting benchmark ($RUNS runs)..."

for ((i=1; i<=RUNS; i++)); do
    # 1. Preparation Step
    # Remove build dir, sync, and drop caches
    eval "$PREPARE_CMD" > /dev/null 2>&1

    result=$(taskset -c "$CORE_ID" perf stat -x, -e task-clock "$CMD" 2>&1)
    
    exec_time=$(echo "$result" | grep "duration_time" | cut -d, -f1)

    times+=("$exec_time")

    echo "Iteration $i/$ITERATIONS: $exec_time ns"
done

echo "${times[@]}" > "$OUTPUT_FILE"

echo "Done. Times saved to $OUTPUT_FILE"
