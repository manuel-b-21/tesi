#!/bin/bash

input_file='joint.dat'
output_file='joint_av.dat'

av=$(cat $input_file | grep "#" | grep -v "m" | awk '{print $2 " " $3 " " $4}')
for element in "${av}"; do
    echo "$element" > $output_file
done