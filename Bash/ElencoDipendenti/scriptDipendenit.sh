mkdir Elenco 2>/dev/null
cd Elenco
listaDipendentiVecchi=()
listaDipendentiNuovi=()
cont=0
while read -r riga; do
    mkdir "$riga" 2>/dev/null
    listaDipendentiNuovi[$cont]=$riga
    cont=$((cont+1))
done < ../ElencoDipendenti.txt

ls -d */ > ElencoVecchiDipendenti.txt   # tutte le cartelle delle directory corrente le scrivo in un file.
# cat ElencoVecchiDipendenti.txt

cont=0
while read -r riga; do
    listaDipendentiVecchi[$cont]="$riga"
    cont=$((cont+1))
done < ElencoVecchiDipendenti.txt

cont=0
dipendentiLicenziati=()
temp=0
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
    cont=$((cont1+1))
done

for i in ${dipendentiLicenziati[@]}; do
    echo $i     # capisco chi è stato licenziato
    # rm -r $i 2>/dev/null
done
    

