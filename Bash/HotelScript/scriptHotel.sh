percorso="Lavoro/Privato/CatalogoMultimediale/"
scelta=$1

if [[ "$scelta" == "mod" ]]; then
    folder=$(ls -d */)
    echo "Autenticazione per la sovrascrittura: "
    ssh jim_bug@jimOffice 'find $percorso$folder* -type f -delete ; exit'   # accedo da remoto al server, ed elimino tutti i file
    echo "Autenticazione per l'aggiornamento: "
    scp -r ls -d */ jim_bug@jimOffice:$percorso 2>/dev/null # copio da remoto tutti i nuovi file
else
    scp -r ls -d */ jim_bug@jimOffice:$percorso 2>/dev/null
fi 
