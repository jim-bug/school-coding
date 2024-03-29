#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Consegna: Dato in input da linea di comando anno, mese e numero di mesi da stampare, mandare a video il calendario formato da i mesi selezionati.
# bash scriptCalendario-sh anno meseIniziale numeroDiMesiDaStampare 
anno=$1
mese=$2
stampaQui=$4
primoGiorno=$(date -d "${anno}-${mese}-01" +%w)
contaGiorni=1
numeroGiorniMese=0
numeroMesi=$3
mkdir Calendario${numeroMesi}MesiAnno${anno} 2>/dev/null
cd Calendario${numeroMesi}MesiAnno${anno}
# echo "Calendario ${anno} composto da ${numeroMesi} mesi" > Mese${i}.txt
for (( i=1; i<=numeroMesi; i++ ));
do
        if [[ $mese -eq 11 || $mese -eq 4 || $mese -eq 6  || $mese -eq 9 ]]; then
                numeroGiorniMese=30
        elif [[ $mese -eq 2 ]]; then
                numeroGiorniMese=28
        else
                numeroGiorniMese=31
        fi
        echo "Mese: "${mese} >> Mese${mese}.txt
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
                        if [[ $controlloSettimana -eq 0 ]]; then
	                         if [[ $k -gt 9 ]]; then
                                        echo -n "$k " >> Mese${mese}.txt
                                        echo "" >> Mese${mese}.txt
                                else
                                        echo -n "$k  " >> Mese${mese}.txt
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
        echo "" >> Mese${mese}.txt
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
if [[ $stampaQui == 1 ]]; then
	cat Mese*.txt
	echo ""
fi
cd ..
