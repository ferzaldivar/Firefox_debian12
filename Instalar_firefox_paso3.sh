#!/bin/bash

# Tercer paso
# Configura APT para dar prioridad a los paquetes del repositorio de Firefox:

echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

