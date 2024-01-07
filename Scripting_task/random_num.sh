#!/bin/bash

if [ "$#" -ne 2 ];
then
        echo "Usage $0 <min_range> <max_range>"
        exit 1
fi

min_range="$1"
max_range="$2"

if ! [[ "$min_range" =~ ^[0-9]+$ && "$max_range" =~ ^[0-9]+$ ]];
then
        echo "min_range and max_range"
        exit 1
fi

random_number=$((RANDOM % (max_range - min_range +1) + min_range))

echo "number between $min_range and $max_range: $random_number"