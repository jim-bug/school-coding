# Script Sonoro Locale per GCS
# Data: 28/11/2023
# Realizzato da:
# Ignazio Leonardo Calogero Sperandeo
# Benedetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila

localUser="alunni"
remoteHost="l415l00"
remotePath="/var/www/html/pub/catalogo_sonoro/"
localUser1="4C"
remoteHost1="l415l01"
destinationPath="/home/4C/Scaricati/SonoroScript/CatalogoSonoro"
export localPath=\"/var/www/html/pub/catalogo_sonoro\"
remotePass="Albicocca"
mkdir -p CatalogoSonoro 
echo "Autenticazione per l'esecuzione: "
sshpass -p "alunni" ssh $localUser@$remoteHost " bash -x -s << prova 
cd $localPath
file * \| grep -E '44100 Hz|44.1 kHz' \| cut -d: -f\1 \| xargs \-I \{} sshpass -p $remotePass scp {} $localUser@$remoteHost:$destinationPath
prova
"
ls CatalogoSonoro
