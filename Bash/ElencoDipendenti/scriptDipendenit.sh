mkdir Elenco 2>/dev/null
cd Elenco
listaDipendentiVecchi=()
listaDipendentiNuovi=()
cont=0
while read -r riga; do
    mkdir $riga 2>/dev/null
    listaDipendentiNuovi[$cont]=$riga
    cont=$((cont+1))
done < ../ElencoDipendenti.txt
ls -d */ > ElencoVecchiDipendenti.txt
# cat ElencoVecchiDipendenti.txt
cont=0
while read -r riga; do
    # mkdir $riga 2>/dev/null
    # len=${#riga}
    # echo $len
    # len=$((len-2))
    listaDipendentiVecchi[$cont]=$riga  # non comprendo il / finale
    cont=$((cont+1))
done < ElencoVecchiDipendenti.txt

cont=0
while read -r riga; do
    if [[ "$riga/" != "${listaDipendentiVecchi[$cont]}" ]]; then
        echo ${listaDipendentiVecchi[$cont]} " " $riga
        
        rm -r ${listaDipendentiVecchi[$cont]}/
    fi
    cont=$((cont+1))
done < ../ElencoDipendenti.txt
