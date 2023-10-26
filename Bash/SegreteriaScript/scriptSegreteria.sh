numeroClassi=5
sezioneClassi="A"
julianDay=$(date +%d)   # ottengo il giorno corrente
# echo $julianDay
for((i=1;i<=numeroClassi;i++));
do
    mkdir ${i}${sezioneClassi} 2>/dev/null
    cd ${i}${sezioneClassi}
    ln -s ../Circolari/Registro.txt Registro 2>/dev/null     # creo il link simbolico al file Registro.txt
    cd ..
    chmod a-w ${i}${sezioneClassi}    # cambio i permessi delle cartelle(sola lettura)
done
mkdir Backup 2>/dev/null
# se il giorno corrente è il primo del mese, entro dentro la cartella Backup e creo la copia del Mese corrente.
if [[ $julianDay == 01 ]]; then
    cd Backup
    cp ../Circolari/Registro.txt .
    mv Registro.txt Registro_$(date +%B)
fi

