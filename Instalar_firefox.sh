#!/bin/bash

# Se crea un directorio para almacenar las claves del repositorio APT

sudo install -d -m 0755 /etc/apt/keyrings

# Importa la clave del repositorio APT de Firefox:

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
If you do not have wget installed, you can install it with: sudo apt-get install wget

# 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3. El siguiente comando es para verificar la clave:

gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'


#  Configura APT para dar prioridad a los paquetes del repositorio de Firefox:

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

# Actualiza los paquetes e instala Firefox y su paquete en español:

sudo apt-get update && sudo apt-get install firefox
sudo apt-get install firefox-l10n-es-ar
