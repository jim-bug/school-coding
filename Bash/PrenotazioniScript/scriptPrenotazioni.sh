parametro=$1
mkdir prenotazioni 2>/dev/null
cd prenotazioni
if [[ "$parametro" == "-v" ]]; then
	cat Prenotazione*.txt
elif [[ "$parametro" == "-i" ]]; then
	# echo ${#}
	if [[ ${#} -ne 4 ]]; then
		dataDiOggi=$(date +%m/%d/%Y)
		echo "Inserisci l'id della prenotazione: "
		read id
		echo "Inserisci il nome e cognome: "
		read nome
		echo "Inserisci la data prenotazione: "
		read dataPrenotazione
		
		giornoPrenotazione=${dataPrenotazione:3:2}
		giornoDiPrenotazione=${dataDiOggi:3:2}
		meseDiPrenotazione=${dataDiOggi:0:2}
		mesePrenotazione=${dataPrenotazione:0:2}
		annoDiPrenotazione=${dataDiOggi:7:4}
		annoPrenotazione=${dataPrenotazione:7:4}
		echo "Prenotazioni: " > Prenotazione$nome.txt
		echo "Numero identificativo: "$id >> Prenotazione$nome.txt
		echo "Numero e cognome: "$nome >> Prenotazione$nome.txt
		# Scrivo su un file se l'errore del comando date se c'è, se il file non è vuoto significa che la data non è valida
		date -d "$dataPrenotazione" 2> erroreData2.txt
	else
		dataDiOggi=$(date +%m/%d/%Y)
		echo "Prenotazioni: " > Prenotazione$3.txt
		echo "Numero identificativo: "$2 >> Prenotazione$3.txt
		echo "Numero e cognome: "$3 >> Prenotazione$3.txt
		giornoPrenotazione=${4:3:2}
		giornoDiPrenotazione=${dataDiOggi:3:2}
		meseDiPrenotazione=${dataDiOggi:0:2}
		mesePrenotazione=${4:0:2}
		annoDiPrenotazione=${dataDiOggi:7:4}
		annoPrenotazione=${4:7:4}
		echo $giornoDiPrenotazione $giornoPrenotazione $meseDiPrenotazione $mesePrenotazione
		date -d "$4" 2> erroreData2.txt
		nome=$3
		dataPrenotazione=$4
	fi
	
	if [[ -s erroreData2.txt ]]; then
		echo "Data di prenotazione: Non validaa" >> Prenotazione$nome.txt
        echo "Data della prenotazione: Non validaa" >> Prenotazione$nome.txt
	else
		if [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -eq $meseDiPrenotazione ]]; then
                        if [[ $giornoPrenotazione -gt $giornoDiPrenotazione ]]; then
                                echo "Data di prenotazione: "$dataDiOggi >> Prenotazione$nome.txt
                                echo "Data della prenotazione: "$dataPrenotazione >> Prenotazione$nome.txt
                        fi
		elif [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -lt $meseDiPrenotazione ]]; then
						echo "Data di prenotazione: Non valida" >> Prenotazione$nome.txt
						echo "Data della prenotazione: Non valida" >> Prenotazione$nome.txt
		elif [[ $annoDiPrenotazione -eq $annoPrenotazione && $mesePrenotazione -gt $meseDiPrenotazione ]]; then
						echo "Data di prenotazione: "$dataDiOggi >> Prenotazione$nome.txt
                        echo "Data della prenotazione: "$dataPrenotazione >> Prenotazione$nome.txt
		elif [[ $annoPrenotazione -gt $annoDiPrenotazione ]]; then
						echo "Data di prenotazione: "$dataDiOggi >> Prenotazione$nome.txt
						echo "Data della prenotazione: "$dataPrenotazione >> Prenotazione$nome.txt
		fi
                echo "" >> Prenotazione$nome.txt
	fi
	rm erroreData2.txt
fi



cd ..
