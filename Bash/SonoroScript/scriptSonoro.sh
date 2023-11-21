percorso="Lavoro/Privato"
mkdir CatalogoSonoro 2>/dev/null
echo "Autenticazione per la copia dello script: "
scp scriptSonoroRemoto.sh jim_bug@jimOffice:
echo "Autenticazione per l'esecuzione: "
ssh jim_bug@jimOffice "bash scriptSonoroRemoto.sh"
