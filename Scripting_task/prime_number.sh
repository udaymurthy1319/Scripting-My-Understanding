#!/bin/bash

echo "enter the range (start end):"
read start end

echo "prime num in range $start to $end are:"

for ((i=start; i<=end; i++));
        do
                is_prime=true

                if [ $i -eq 1 ]; then
                        is_prime=false
                fi

                for ((j=2; j*j<=i; j++)); do
                        if [ $((i % j)) -eq 0 ]; then
                                is_prime=false
                                break
                        fi
                done

                if $is_prime; then
                        echo $i
                fi
        done