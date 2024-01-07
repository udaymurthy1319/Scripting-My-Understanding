#!/bin/bash

echo "Enter a string"
read input_string
clean_string=$(echo "$input_string" | tr -d ' ' | tr '[:upper:]' '[:lower:]')

reversed_string=$(echo "$clean_string" | rev)

if [ "$clean_string" == "$reversed_string" ]; then
        echo "palindrome"
else
        echo "no"
fi