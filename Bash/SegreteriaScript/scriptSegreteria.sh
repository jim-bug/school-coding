numeroClassi=5
sezioneClassi="A"
julianDay = $(date +%w)
# julianDay=1
for((i=1;i<=numeroClassi;i++));
do
    mkdir ${i}${sezioneClassi}
    cd ${i}${sezioneClassi}
    ln ../Circolari/Registro.txt Registro     # creo il link al file Registro.txt
    cd ..
    chmod a-w ${i}${sezioneClassi}    # cambio i permessi del link(sola lettura)
done
mkdir Backup
cd Backup
if [[ $julianDay == 1 ]]; then
    cp ../Circolari/Registro.txt .
    mv Registro.txt Registro$(date +%B)
fi