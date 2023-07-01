# !bin/bash
set -eo pipefail
shopt -s nullglob
# script para obtener los colaboradores de un repositorio de GitHub
# usar autenticacion de tipo token
# REPO_OWNER= CamilaCosentino
# REPO_NAME= FronzenBaron
# TOKEN=ghp_1234567890

get_data(){
  local REPO_OWNER=$1
  local REPO_NAME=$2 
  local TOKEN=$3
  local API_URL="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/collaborators"

  RESPONSE=$(curl -s -H "Authorization: Bearer $TOKEN" "$API_URL")

  if [[ "$RESPONSE" == *"Bad credentials"* ]]; then
    echo "Error: Token invalido"
    exit 1
  else
    echo "$RESPONSE" | jq '.' > data.json
  fi
}
process_data(){
  local FILE=$1
  jq -r '.[].login' $FILE > usernames.txt
}

help(){
  echo "Uso: $0 -n <username> -r <reponame> -t <token>"
  echo " -o <username>: Especifica el nombre del propietario del repositorio"
  echo " -r <repo>: Especifica el nombre del repositorio"
  echo " -t <token>: Especifica el token de autenticacion"
}

main(){
  get_data "$REPO_OWNER" "$REPO_NAME" "$TOKEN"
  process_data "data.json"
}

while getopts ":o:r:t:h" opt; do
  case $opt in
    o) REPO_OWNER="$OPTARG"
    ;;
    r) REPO_NAME="$OPTARG"
    ;;
    t) TOKEN="$OPTARG"
    ;;
    h) help
    exit 0
    ;;
    \?) echo "Opcion invalida -$OPTARG" >&2
    help
    exit 1
    ;;
    :) echo "Opcion -$OPTARG requiere un argumento" >&2
    help
    exit 1
    ;;

  esac
done

main  "$REPO_OWNER" "$REPO_NAME" "$TOKEN"
  