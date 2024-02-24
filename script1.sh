

#!/bin/bash

#####################
#
# Author= Lokesh
# Date= 24/02/2024
#
# This script prints numbers not divisible by 3, 5, and not 15
#####################

for i in {1..100}; do
    if [ $((i % 3)) -eq 0 ] || [ $((i % 5)) -eq 0 ] && [ $((i % 15)) -ne 0 ]; then
        echo $i
    fi
done
