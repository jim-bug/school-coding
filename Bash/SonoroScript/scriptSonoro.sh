percorso="Lavoro/Privato"
mkdir -p CatalogoSonoro 
echo "Autenticazione per la copia dello script: "
scp scriptSonoroRemoto1.sh jim_bug@jimOffice:
echo "Autenticazione per l'esecuzione: "
ssh jim_bug@jimOffice "bash scriptSonoroRemoto1.sh"
ls CatalogoSonoro
