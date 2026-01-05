#!/bin/sh

for i in /proc/irq/*/smp_affinity_list; do
    echo "setup $i"
    echo "0-14" > "$i"
done
echo 7fff | sudo tee /proc/irq/default_smp_affinity
