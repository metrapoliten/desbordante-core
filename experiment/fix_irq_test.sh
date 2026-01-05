#!/bin/sh

for i in /proc/irq/*/smp_affinity; do
    v=$(cat "$i")
    if [ "$v" = "8000" ]; then
        echo "settings $i to 4000"
        echo 4000 > "$i"
    else
        vnew=$((0x$v & ~8000))
        
        if [ "$vnew" -eq 0 ]; then
            vnew=1
        fi
        vnewhex="$(printf %04x $vnew)"
        if [ "$vnewhex" != "$v" ]; then
            echo "v = $v; vnew = $vnew; vnewhex = $vnewhex"
            echo "setting $i to $vnewhex"
            echo "$vnewhex" > "$i"
        fi
    fi
done
echo 7fff | sudo tee /proc/irq/default_smp_affinity

