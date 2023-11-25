percorso="/home/jim_bug/school-coding/Bash/SonoroScript/CatalogoSonoro"
cd Lavoro/Privato
ls CatalogoSonoro > /home/jim_bug/fileSonori.txt
while read -r riga; do
    file CatalogoSonoro/"$riga" | grep -E '44.1 kHz|44100 Hz' > temp.txt # se i file sono .mp3 rappresenta la frequenza di campionamento in kHz, se sono in .wav in Hz.
    # cat temp.txt
    if [[ -s temp.txt ]]; then
        sshpass -p "Ignazio" scp "CatalogoSonoro/$riga" jim_bug@loffice:$percorso # da provare
    fi
    rm temp.txt
done < /home/jim_bug/fileSonori.txt
rm /home/jim_bug/scriptSonoroRemoto.sh
rm /home/jim_bug/fileSonori.txt
