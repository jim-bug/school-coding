# Script Sonoro Locale per GCS
# Data: 28/11/2023
# Realizzato da:
# Ignazio Leonardo Calogero Sperandeo
# Benedetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila

user=$(whoami)
mkdir -p CatalogoSonoro 
echo "Autenticazione per la copia dello script: "
scp scriptSonoroRemoto1.sh $user@jimOffice:
echo "Autenticazione per l'esecuzione: "
ssh $user@jimOffice "bash scriptSonoroRemoto1.sh"
ls CatalogoSonoro
