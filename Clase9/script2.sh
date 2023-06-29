REPO_OWNER="yugarcia"
REPO_NAME="devops-63703"
REPO_TOKEN="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"
API_URL1="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/collaborators"
API_URL2="https://api.github.com/repos/$REPO_OWNER/$REPO_NAME/teams"


# get github collaborators
#RESPUESTA=$(curl -s -H "Authorization: Bearer $REPO_TOKEN" "$API_URL1")
#USER=$(echo $RESPUESTA | jq -r '.[].login')
#echo $USER

# get github tags
RESPUESTA2=$(curl -s -H "Authorization: Bearer $REPO_TOKEN" "$API_URL2")
USER2=$(echo $RESPUESTA2)
echo $USER2