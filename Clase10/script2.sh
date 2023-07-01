#!/bin/bash

#REPO_OWNER="yugarcia"
#REPO_NAME="devops-63703"
#REPO_TOKEN="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"
#API_URL1="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/collaborators"
#API_URL2="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/teams"

set -eo pipefail
shopt -s nullglob

get_data(){

    local REPO_OWNER=$1
    local REPO_NAME=$2
    local REPO_TOKEN=$3
    local API_URL1="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/collaborators"

    RESPUESTA=$(curl -s -H "Authorization: Bearer $REPO_TOKEN" "$API_URL1")

    if [[ "$RESPUESTA" == *"Bad crediantials"* ]] ; then
        echo "Error: Token Invalido"
        exit 1
    else
        echo $RESPUESTA | JQ '' > data.json
    fi

}

process_data(){
    local file=$1
     jq -r '.[].login' $file > users.txt

}

help(){
  echo "Uso: $0 -n <username> -r <reponame> -t <token>"
  echo " -o <username>: Especifica el nombre del propietario del repositorio"
  echo " -r <repo>: Especifica el nombre del repositorio"
  echo " -t <token>: Especifica el token de autenticacion

main(){
          if [[ -z "$REPO_OWNER" || -z "$REPO_NAME" || -z "$REPO_TOKEN" ]]; then
        echo "Error: Faltan argumentos."
        help
        exit 1
       fi

       get_data $REPO_OWNER $REPO_NAME $REPO_TOKEN
       process_data "data.json"
       cat data.json
  
}

while getopt -o ":o:r:t:h" opt; do
        case $opt in
            o) REPO_OWNER=$OPTARG
            ;;
            r) REPO_NAME=$OPTARG
            ;;
            t) REPO_TOKEN=$OPTARG
            ;;
            h) help
            exit 0
            ;;
            \?) echo "Opcion invalida: -$OPTARG" >&2
            help
            exit 1
            ;;
            :) echo " Opcion -$OPTARG requiere un argumento." >&2
            help
            exit 1
            ;;
        esac
        done

    main $REPO_OWNER $REPO_NAME $REPO_TOKEN
   