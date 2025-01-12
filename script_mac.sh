#!/bin/bash

# Lancer le conteneur en mode détaché et récupérer l'ID
CONTAINER_ID=$(docker run -d --rm -p 1883:1883 -p 9001:9001 toke/mosquitto)

# Vérifier si le conteneur a été lancé correctement
if [ -z "$CONTAINER_ID" ]; then
    echo "Erreur : Impossible de lancer le conteneur Docker."
    exit 1
fi

echo "Conteneur lancé avec l'ID : $CONTAINER_ID"

# Ouvrir deux nouvelles fenêtres de Terminal et exécuter docker exec dans chacune
osascript <<EOF
tell application "Terminal"
    do script "docker exec -ti $CONTAINER_ID bash"
    do script "docker exec -ti $CONTAINER_ID bash"
end tell
EOF

