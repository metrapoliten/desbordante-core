#!/bin/sh

for i in /proc/irq/*/smp_affinity; do
    v=$(cat "$i")
    if [ "$v" = "8" ]; then
        echo "settings $i to 4"
        echo 4 > "$i"
    else
        vnew=$((0x$v & ~8))
        vnewhex=$(printf %x $vnew)
        if [ "$vnewhex" != "$v" ]; then
            echo "v = $v; vnewhex = $vnewhex"
            echo "setting $i to $vnew"
            echo "$vnewhex" > "$i"
        fi
    fi
done
echo 7 | sudo tee /proc/irq/default_smp_affinity
