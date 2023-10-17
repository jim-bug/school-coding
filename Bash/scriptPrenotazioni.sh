parametro=$1
nome=0
id=0
dataDiPrenotazione=0
dataPrenotazione=0
mkdir prenotazioni 2>/dev/null
cd prenotazioni
if [[ "$parametro" == "-v" ]]; then
	cat Prenotazione*.txt
elif [[ "$parametro" == "-i" ]]; then
	if [[ ${#@} -ne 4 ]]; then
		echo "Inserisci l'id della prenotazione: "
		read id
		echo "Inserisci il nome e cognome: "
		read nome
		echo "Inserisci la data di prenotazione: "
		read dataDiPrenotazione
		echo "Inserisci la data prenotazione: "
		read dataPrenotazione
		giornoPrenotazione=${dataPrenotazione:8:2}
		giornoDiPrenotazione=${dataDiPrenotazione:8:2}
		meseDiPrenotazione=${dataDiPrenotazione:5:2}
		mesePrenotazione=${dataPrenotazione:5:2}
		annoDiPrenotazione=${dataDiPrenotazione:0:4}
		annoPrenotazione=${dataPrenotazione:0:4}
		echo "Prenotazioni: " > Prenotazione$nome.txt
		echo "Numero identificativo: "$id >> Prenotazione$nome.txt
		echo "Numero e cognome: "$nome >> Prenotazione$nome.txt
		date -d "$dataDiPrenotazione" 2> erroreData.txt
		date -d "$dataPrenotazione" 2> erroreData2.txt
	else
		echo "Prenotazioni: " > Prenotazione$3.txt
		echo "Numero identificativo: "$2 >> Prenotazione$3.txt
		echo "Numero e cognome: "$3 >> Prenotazione$3.txt
		giornoPrenotazione=${5:8:2}
		giornoDiPrenotazione=${4:8:2}
		meseDiPrenotazione=${4:5:2}
		mesePrenotazione=${5:5:2}
		annoDiPrenotazione=${4:0:4}
		annoPrenotazione=${5:0:4}
		echo $giornoDiPrenotazione $giornoPrenotazione $meseDiPrenotazione $mesePrenotazione
		date -d "$4" 2> erroreData.txt
		date -d "$5" 2> erroreData2.txt
		nome=$3
		dataDiPrenotazione=$4
		dataPrenotazione=$5
	fi
	echo $giornoDiPrenotazione $giornoPrenotazione $meseDiPrenotazione $mesePrenotazione
	if [[ -s erroreData.txt || -s erroreData2.txt ]]; then
		echo "Data di prenotazione: Non validaa" >> Prenotazione$nome.txt
        echo "Data della prenotazione: Non validaa" >> Prenotazione$nome.txt
	else
		if [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -eq $meseDiPrenotazione ]]; then
                        if [[ $giornoPrenotazione -gt $giornoDiPrenotazione ]]; then
                                echo "Data di prenotazione: "$dataDiPrenotazione >> Prenotazione$nome.txt
                                echo "Data della prenotazione: "$dataPrenotazione >> Prenotazione$nome.txt
                        fi
		elif [[ $annoPrenotazione -eq $annoDiPrenotazione && $mesePrenotazione -lt $meseDiPrenotazione ]]; then
						echo "Data di prenotazione: Non valida" >> Prenotazione$nome.txt
						echo "Data della prenotazione: Non valida" >> Prenotazione$nome.txt
		elif [[ $annoDiPrenotazione -eq $annoPrenotazione && $mesePrenotazione -gt $meseDiPrenotazione ]]; then
						echo "Data di prenotazione: "$dataDiPrenotazione >> Prenotazione$nome.txt
                        echo "Data della prenotazione: "$dataPrenotazione >> Prenotazione$nome.txt
		elif [[ $annoPrenotazione -gt $annoDiPrenotazione ]]; then
						echo "Data di prenotazione: "$dataDiPrenotazione >> Prenotazione$nome.txt
						echo "Data della prenotazione: "$dataPrenotazione >> Prenotazione$nome.txt
		fi
                echo "" >> Prenotazione$nome.txt
	fi
	
fi


# rm errore*.txt
cd ..
