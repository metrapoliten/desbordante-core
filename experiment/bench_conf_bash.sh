#!/usr/bin/env bash

# Configuration
RUNS=500
OUTPUT_FILE="experiment/configure_without_changes_bash.json"
BUILD_DIR="build"
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
    rm -rf "${BUILD_DIR/}"
    sync
    echo 3 | sudo tee /proc/sys/vm/drop_caches > /dev/null

    # 2. Execution Step
    # We use a temp file to store the time because capturing stderr 
    # while silencing the command's output is tricky in one line.
    TIME_TEMP=$(mktemp)

    # - taskset -c 15: Pin to core 15
    # - /usr/bin/time -f "%e": Output only the elapsed real time in seconds
    # - -o "$TIME_TEMP": Write time to temp file (so we can discard command output)
    taskset -c 15 time -f "%e" -o "$TIME_TEMP" sh -c "$CMD > /dev/null 2>&1"

    # Read the time
    ELAPSED=$(cat "$TIME_TEMP")
    rm "$TIME_TEMP"

    # 3. Save to JSON
    # If it's not the first item, add a comma separator
    if [ "$i" -ne 1 ]; then
        echo -n ", " >> "$OUTPUT_FILE"
    fi
    # Append the time to the file
    echo -n "$ELAPSED" >> "$OUTPUT_FILE"

    # Optional: Print progress
    echo -ne "Run $i/$RUNS: ${ELAPSED}s\r"
done

# Close the JSON array
echo "]" >> "$OUTPUT_FILE"

echo -e "\nBenchmark complete. Results saved to $OUTPUT_FILE"
