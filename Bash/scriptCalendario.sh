#!/bin/bash

anno=$1
mese=$2
primoGiorno=$(date -d "${anno}-${mese}-01" +%w)
echo $primoGiorno
contaGiorni=1
numeroGiorniMese=0
numeroMesi=$3
# echo -n Mese $mese Anno $anno PrimoGiorno $primoGiorno
mkdir CalendarioTreMesiAnno${anno} 2>/dev/null
cd CalendarioTreMesiAnno${anno}
# for i in $(seq 0 $((numeroMesi-1)))
for (( i=1; i<=numeroMesi; i++ ));
do
        if [[ $mese -eq 11 || $mese -eq 4 || $mese -eq 6  || $mese -eq 9 ]]; then
                numeroGiorniMese=30
        elif [[ $mese -eq 2 ]]; then
                numeroGiorniMese=28
        else
                numeroGiorniMese=31
        fi
        echo "Mese: "${mese} > Mese${mese}.txt
        echo DO LU MA ME GI VE SA >> Mese${mese}.txt
        for (( j=0; j<$primoGiorno; j++ ))
        do
                echo -n "#  " >> Mese${mese}.txt
        done
        giorniMancanti=$((7-primoGiorno))
        for ((k=1; k<=numeroGiorniMese; k++))
        do
                if [[ $k -le $giorniMancanti ]]; then
                        echo -n "$k  " >> Mese${mese}.txt
                        if [[ $k -eq $giorniMancanti ]]; then
                                echo "" >> Mese${mese}.txt
                        fi
                else
                        controlloSettimana=$((contaGiorni%7))
                        # echo "Resto per 7 "${controlloSettimana} "In iterazione ${k}" "Contatore ${contaGiorni}"
                        if [[ $controlloSettimana -eq 0 ]]; then
                                if [[ $k -gt 9 ]]; then
                                        echo "$k " >> Mese${mese}.txt
                                        echo "" >> Mese${mese}.txt
                                else
                                        echo "$k  " >> Mese${mese}.txt
                                        echo "" >> Mese${mese}.txt
                                fi
                        else
                                if [[ $k -gt 9 ]]; then
                                        echo -n "$k " >> Mese${mese}.txt
                                else
                                        echo -n "$k  " >> Mese${mese}.txt
                                fi
                        fi     
                        contaGiorni=$((contaGiorni+1))
                fi
        done
        if [[ $mese -eq 12 ]]; then
                anno=$((anno+1))
                mese=1
                primoGiorno=$(date -d "${anno}-${mese}-01" +%w)
        else
                mese=$((mese+1))
                primoGiorno=$(date -d "${anno}-${mese}-01" +%w)
        fi
        contaGiorni=1
done
cd ..
