# utiliza el ciclo for para recorrer archivos de un directorio.

read -p "Ingrese el directorio: " DIR

if [[ ! -d "$DIR" ]]; then
    echo "El directorio $DIR no existe."
    exit 1
fi

for FILE in "$DIR"/*; do
    if [[ -f "$FILE" &&  "$FILE" == *.txt ]]; then
        echo -e "-----------------"
        while read -r LINE; do
            echo "$LINE"
        done < "$FILE"
        echo -e "-----------------\n"
    fi
done