# Script Sonoro Locale per GCS
# Data: 28/11/2023
# Realizzato da:
# Ignazio Leonardo Calogero Sperandeo
# Benedetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila

remoteUser="alunni"
remotePath="/var/www/html/pub/catalogo_sonoro/"
remotePass="alunni"
remoteHost="l415l00"
sshpass -p $remotePass ssh $remoteUser@$remoteHost "cd $remotePath ; file * | grep -E '44100 Hz|44.1 kHz' | cut -d: -f1"
