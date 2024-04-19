#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Generatore di file con numeri in virgola mobile(randomici) + data. 

data=$(date +%x)	# data nel formato dd/mm/yyyy
for ((i=0;i<5;i++)) do
     for ((j=0;j<100;j++)) do
           numero_random=$((RANDOM % 5000)).$((RANDOM % 100))
           echo "$data $numero_random" >> cash$i
     done
done
