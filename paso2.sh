#!/bin/bash

# Segundo paso en la instalación de Firefox
# 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3. El siguiente comando es para verificar la clave:

gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'

bash paso3.sh
