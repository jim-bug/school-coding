# Autori:
# Ignazio Leonardo Calogero Sperandeo
# Pietro Lo Bocchiaro
# Filippo Stancampiano
# Emmanuel Galletti
# Data: 21/11/2023
percorso="Lavoro/Privato/CatalogoMultimediale/"
scelta=$1

if [[ "$scelta" == "mod" ]]; then
    folder=$(ls -d */)
    echo "Autenticazione per l'eliminazione: "
    # ssh jim_bug@jimOffice "find $percorso$folder -mindepth 1 -type f,l,d -delete"  # accedo da remoto al server, ed elimino tutti i file
    ssh jim_bug@jimOffice "rm -r $percorso$folder"
    echo "Autenticazione per l'aggiornamento: "
    scp -r ls -d */ jim_bug@jimOffice:$percorso 2>/dev/null # copio da remoto tutti i nuovi file
else
    echo "Autenticazione per l'aggiornamento: "
    scp -r ls -d */ jim_bug@jimOffice:$percorso 2>/dev/null
fi 
