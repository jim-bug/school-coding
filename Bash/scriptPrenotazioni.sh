parametro=$1
mkdir prenotazioni 2>/dev/null
cd prenotazioni
if [[ "$parametro" == "-v" ]]; then
	cat Prenotazione*.txt
elif [[ "$parametro" == "-i" ]]; then
	echo "Prenotazioni: " > Prenotazione$3.txt
   	echo "Numero identificativo: "$2 >> Prenotazione$3.txt
	echo "Numero e cognome: "$3 >> Prenotazione$3.txt
	giornoPrenotazione=${5:0:2}
	giornoDiPrenotazione=${4:0:2}
	meseDiPrenotazione=${4:3:2}
	mesePrenotazione=${5:3:2}
	annoDiPrenotazione=${4:6:4}
	annoPrenotazione=${5:6:4}
	echo $giornoDiPrenotazione $giornoPrenotazione $meseDiPrenotazione $mesePrenotazione
	date -d "$4" 2> erroreData.txt
	if [ -s erroreData.txt ]; then
		echo "Data di prenotazione: Non validaa" >> Prenotazione$3.txt
        echo "Data della prenotazione: Non validaa" >> Prenotazione$3.txt
	else
		if [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -eq $meseDiPrenotazione ]]; then
                        if [[ $giornoPrenotazione -gt $giornoDiPrenotazione ]]; then
                                echo "Data di prenotazione: "$4 >> Prenotazione$3.txt
                                echo "Data della prenotazione: "$5 >> Prenotazione$3.txt
                        fi
		elif [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -lt $meseDiPrenotazione ]]; then
						echo "Data di prenotazione: Non valida" >> Prenotazione$3.txt
						echo "Data della prenotazione: Non valida" >> Prenotazione$3.txt
		elif [[ $annoDiPrenotazione -eq $annoPrenotazione && $mesePrenotazione -gt $meseDiPrenotazione ]]; then
						echo "Data di prenotazione: "$4 >> Prenotazione$3.txt
                        echo "Data della prenotazione: "$5 >> Prenotazione$3.txt
		elif [[ $annoPrenotazione -gt $annoDiPrenotazione ]]; then
						echo "Data di prenotazione: "$4 >> Prenotazione$3.txt
						echo "Data della prenotazione: "$5 >> Prenotazione$3.txt
		fi
                echo "" >> Prenotazione$3.txt
	fi
	
fi


# rm errore*.txt
cd ..
