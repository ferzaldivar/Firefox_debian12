#!/bin/bash

# Primer paso en la instalación de Firefox
# Se crea un directorio para almacenar las claves del repositorio APT

sudo install -d -m 0755 /etc/apt/keyrings

# Importa la clave del repositorio APT de Firefox:

#wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

bash paso1.sh







