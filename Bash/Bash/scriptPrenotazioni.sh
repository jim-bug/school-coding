parametro=$1
if [[ "$parametro" == "-v" ]]; then
	cat Prenotazioni.txt
elif [[ "$parametro" == "-i" ]]; then
    	echo "Prenotazioni: " > Prenotazioni.txt
   	echo "Numero identificativo: "$2 >> Prenotazioni.txt
    	echo "Numero e cognome: "$3 >> Prenotazioni.txt
	giornoPrenotazione=${4:1:1}
	giornoDiPrenotazione=${5:1:1}
    	meseDiPrenotazione=${4:3:1}
    	mesePrenotazione=${5:3:1}
    	annoDiPrenotazione=${4:5:4}
    	annoPrenotazione=${5:5:4}
	date -d "$4" 2> erroreData.txt
	if [ -s erroreData.txt ]; then
		echo "Data di prenotazione: Non valida" >> Prenotazioni.txt
                echo "Data della prenotazione: Non valida" >> Prenotazioni.txt
	else
		if [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -eq $meseDiPrenotazione ]]; then
                        if [[ $giornoPrenotazione -gt $giornoDiPrenotazione ]]; then
                                echo "Data di prenotazione: "$4 >> Prenotazioni.txt
                                echo "Data della prenotazione: "$5 >> Prenotazioni.txt
                        fi
                elif [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -lt $meseDiPrenotazione ]]; then
                                echo "Data di prenotazione: Non valida" >> Prenotazioni.txt
                                echo "Data della prenotazione: Non valida" >> Prenotazioni.txt
                elif [[ $annoPrenotazione -gt $annoDiPrenotazione ]]; then
                                echo "Data di prenotazione: "$4 >> Prenotazioni.txt
                                echo "Data della prenotazione: "$5 >> Prenotazioni.txt
                fi
                echo "" >> Prenotazioni.txt
	fi
fi
# rm errore*.txt
