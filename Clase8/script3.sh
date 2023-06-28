#!/bin/bash

# este script lee un archivo llamado comentarios.txt y lo imprime por pantalla.

FILE="comentarios.txt"

if [[ ! -f "$FILE" ]]; then
    echo "El archivo $FILE no existe."
    exit 1
fi

while read -r LINE; do
    echo "$LINE"
done < "$FILE"

echo "Terminó de leer el archivo."