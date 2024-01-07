#!/bin/bash

echo "Enter a string"
read input_string

reversed_stirng=$(echo $input_string | rev)

echp "reversed string"