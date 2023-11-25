# Script Sonoro Remoto per GCS
# Data: 28/11/2023
# Realizzato da:
# Ignazio Leonardo Calogero Sperandeo
# Benedetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila
# Soluzione 2:
user=$(whoami)
percorso="/home/jim_bug/school-coding/Bash/SonoroScript/CatalogoSonoro"
cd Lavoro/Privato/CatalogoSonoro
file * | grep -E '44100 Hz|44.1 kHz' | cut -d: -f1 | xargs -I {} sshpass -p "Ignazio" scp {} $user@loffice:$percorso
