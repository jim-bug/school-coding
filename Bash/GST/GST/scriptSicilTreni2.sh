# Autori:
# Ignazio Leonardo Calogero Sperandeo
# Bendetto Migliore
# Alex Chirvasa
# Alessandro Cangiamila
# Data: 18/12/2023

stazione=$1
ritardoTreni=$2
backup=$3
mkdir Backup 2>/dev/null/
data=$(date +%D)
wget "http://l415l00/pub/siciltreni/$stazione.txt"
if [[ $ritardoTreni == 1 ]]; then
	cat "$stazione.txt" | xargs -I {} echo {} |  awk -F '.' '{print ($3 > 0) ? $cat : ""}' | xargs -I {} echo {} > "$stazione-$(date +%F)-ritardo.txt"
    # $cat si riferisce alla stringa su cui sta lavorando xargs e awk, l'ultimo xargs serve per evitare le andate a capo nell stdout
    if [[ $backup == 1]]
else
    cat "$stazione.txt" > "$stazione-$(date +%F).txt"
fi

if [[ -f "$stazione-$(date +%F)-ritardo.txt" && $backup == 1]]; then
    mv "$stazione-$(date +%F)-ritardo.txt" Backup
else if [[ -f "$stazione-$(date +%F).txt" && $backup == 1]];
    mv "$stazione-$(date +%F).txt" Backup

# rm *.txt
