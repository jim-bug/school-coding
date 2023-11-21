percorso="home/jim_bug/school-coding/Bash/SonoroScript/CatalogoSonoro"
cd Lavoro/Privato
ls CatalogoSonoro > /home/jim_bug/fileSonori.txt
while read -r riga; do
    file CatalogoSonoro/$riga | grep -E '44.1|44100' > temp.txt
    cat temp.txt
    if [[ -s temp.txt ]]; then
        sshpass -p "pass" scp CatalogoSonoro/$riga jim_bug@loffice:$percorso # da provare
    fi
    rm temp.txt
done < fileSonori.txt

