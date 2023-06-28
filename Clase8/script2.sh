#!/bin/bash

# Script: countdown.sh
# Author: John Doe
# Description: This script performs a countdown from a specified number.

echo "ingresa un numero"

read NUMERO

if ! [[ "$NUMERO" =~ ^[0-9]+$ ]]; then
    echo "Este es un valor invalido."
    exit 1
fi

while ((NUMERO > 0)); do
    echo "$NUMERO"
    sleep 1
    ((NUMERO--))
done
 echo "Terminó el conteo."