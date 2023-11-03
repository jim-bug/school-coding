mkdir Elenco 2>/dev/null
cd Elenco
listaDipendentiVecchi=()
listaDipendentiNuovi=()
cont=0
# ciclo che crea le cartelle con i nomi dei dipendenti e popola l'array con i nomi dei dipendenti
while read -r riga; do
    mkdir "$riga" 2>/dev/null
    listaDipendentiNuovi[$cont]=$riga
    cont=$((cont+1))
done < ../ElencoDipendenti.txt

ls -d */ > ElencoVecchiDipendenti.txt   # tutte le cartelle delle directory corrente le scrivo in un file.
# cat ElencoVecchiDipendenti.txt

cont=0
# ciclo che popola l'array con i nomi delle cartelle, questo perchè in caso un utente venga licenziato non sarà nell'array precedente ma sarà in questo e da qui potrò gestire l'evento
while read -r riga; do
    listaDipendentiVecchi[$cont]="$riga"
    cont=$((cont+1))
done < ElencoVecchiDipendenti.txt

cont=0
dipendentiLicenziati=()
temp=0
# effettuo una ricerca sequenziale effettuando un semi-prodotto cartesiano
for i in ${listaDipendentiVecchi[@]}; do
    for j in ${listaDipendentiNuovi[@]}; do
        if [[ "$i" == "$j/" ]]; then
            temp=0
            break
        else
            temp="$i"
        fi
    done
    dipendentiLicenziati[$cont]=$temp
    rm -r $temp 2>/dev/null
    cont=$((cont+1))
done

# se si vuole vedere chi è stato licenziato, levare il commento alla riga 36
for i in ${dipendentiLicenziati[@]}; do
    if [[ $i == 0 ]]; then
        continue
    fi
    echo $i     # capisco chi è stato licenziato
    rm -r $i 2>/dev/null
done
