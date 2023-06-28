#!/bin/bash

# Script: backup_data.sh
# Author: John Doe
# Description: This script creates a backup of the specified directory.
# Date: June 16, 2023
# E-mail: john@doe.com

# salida texto

echo "Bienvenidos al curso"

# Variables: No se requiere declarar un tipo de dato específico

NAME="John"
EDAD=25

echo "hola $NAME hoy cumplis $EDAD años"

# tomar un dato ingresado desde teclado.

echo "Cual es tu nombre?"

read NAME

echo "hola $NAME hoy cumplis $EDAD años"

# Condicionales

echo "te gusta el curso?"
read RESPUESTA

if [[ "$RESPUESTA" == "si" ]]; then
    echo "Genial sigamos aprendiendo"
else
    echo "Que puedo mejorar?"
    read COMENTARIO
fi

# escribe en un archivo los que se intrudce como comentario.

echo "$COMENTARIO" >> comentarios.txt