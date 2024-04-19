#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Generatore di file con numeri interi. 

for ((i=0;i<5;i++)) do
     for ((j=0;j<100;j++)) do
           echo "$RANDOM" >> cash$i
     done
done
