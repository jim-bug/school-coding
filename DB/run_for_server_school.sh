#!/bin/bash
# Autore: Ignazio Leonardo Calogero Sperandeo
# Data: 10/03/2025
# Script per preparare i .sql per il server della scuola.
# by jim_bug // :)


find . -type d | while read -r dir; do
    # dir=$(dirname "$file" | cut -d'/' -f4)  # con cut effettuo lo split di $file per ottenere il nome della cartella dove si trova il .sql, evitando school-coding/DB ecc..
    # mkdir -p "$dir"
    # cp $file "$dir/$(basename "$file")"
    zip -r school.zip "$dir"/*.sql
done

# // :)
