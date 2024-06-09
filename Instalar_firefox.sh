#!/bin/bash

# Se crea un directorio para almacenar las claves del repositorio APT
sudo install -d -m 0755 /etc/apt/keyrings

#Importa la clave de firma del repositorio APT de Mozilla
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null

#La huella digital debe ser 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'

#Agrega el repositorio APT de Mozilla a la lista de fuentes
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

#Configura APT para dar prioridad a los paquetes del repositorio de Mozilla
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

#Actualiza lista de paquetes e instala el paquete Firefox y el paquete de idioma español argentino
sudo apt-get update && sudo apt-get install firefox -y
sudo apt-get install firefox-l10n-fr -y
