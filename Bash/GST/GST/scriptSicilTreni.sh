# Autori:
# Ignazio Leonardo Calogero Sperandeo
# Bendetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila
# Data: 18/12/2023

stazione=$1
ritardoTreni=$2
backup=$3
URL="http://jimoffice/server/GST/Backup/"
data=$(date +%D)
wget "http://jimOffice/server/GST/$stazione.txt"
if [[ $ritardoTreni == 1 ]]; then
	cat "$stazione.txt" | xargs -I {} echo {} |  awk -F '.' '{print ($3 > 0) ? $cat : ""}' | xargs -I {} echo {} > "$stazione-$(date +%F)-ritardo.txt"
    # $cat si riferisce alla stringa su cui sta lavorando xargs e awk, l'ultimo xargs serve per evitare le andate a capo nell stdout
else
    cat "$stazione.txt" > "$stazione-$(date +%F).txt"
fi

if [[ $backup == 1 ]]; then
    if [[ -f "$stazione-$(date +%F)-ritardo.txt" ]]; then
        curl -X PUT -H "Content-Type: text/plain" -T /home/jim_bug/GST/"$stazione-$(date +%F)-ritardo.txt" $URL # aggiungo al server il file dei treni in ritardo
    else
        curl -X PUT -H "Content-Type: text/plain" -T /home/jim_bug/GST/"$stazione-$(date +%F).txt" $URL # aggiungo tutti i treni al server
    fi
fi

# rm *.txt
