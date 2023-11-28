# Script Sonoro Remoto per GCS
# Data: 28/11/2023
# Realizzato da:
# Ignazio Leonardo Calogero Sperandeo
# Benedetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila
# Soluzione 2:
localUser="4C"
remoteHost="l415l01"
destinationPath="/home/4C/Scaricati/SonoroScript/CatalogoSonoro"
localPath="/var/www/html/pub/catalogo_sonoro"
cd $localPath
file * | grep -E '44100 Hz|44.1 kHz' | cut -d: -f1 | xargs -I {} sshpass -p "Albicocca" scp {} $localUser@$remoteHost:$destinationPath
