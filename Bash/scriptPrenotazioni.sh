parametro=$1
if [[ "$parametro" == "-v" ]]; then
    cat Prenotazioni.txt
elif [[ "$parametro" == "-i" ]]; then
    echo "Prenotazioni: " > Prenotazioni.txt
    echo "Numero identificativo: "$2 >> Prenotazioni.txt
    echo "Numero e cognome: "$3 >> Prenotazioni.txt
    meseDiPrenotazione=${4:4:1}
    mesePrenotazione=${5:4:1}
    annoDiPrenotazione=${4:6:4}
    annoPrenotazione=${5:6:4}
    if [[ $annoPrenotazione == $annoDiPrenotazione && $mesePrenotazione == $meseDiPrenotazione ]]; then
		if [[ $giornoPrenotazione > $giornoDiPrenotazione ]]; then
			echo "Data di prenotazione: "$4 >> Prenotazioni.txt
			echo "Data della prenotazione: "$5 >> Prenotazioni.txt
		else
			echo "Data di prenotazione: Non valida" >> Prenotazioni.txt
    			echo "Data della prenotazione: Non valida" >> Prenotazioni.txt
		fi
    elif [[ $annoPrenotazion == $annoDiPrenotazione && $mesePrenotazione < $meseDiPrenotazione ]]; then
			echo "Data di prenotazione: Non valida" >> Prenotazioni.txt
                        echo "Data della prenotazione: Non valida" >> Prenotazioni.txt
    elif [[ $annoPrenotazione > $annoDiPrenotazione ]]; then
			echo "Data di prenotazione: "$4 >> Prenotazioni.txt
    			echo "Data della prenotazione: "$5 >> Prenotazioni.txt
   fi
   echo "" >> Prenotazioni.txt

fi
