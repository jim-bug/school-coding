percorso="Lavoro/Privato/CatalogoSonoro/"
scp -r jim_bug@jimOffice:$percorso /home/jim_bug/school-coding/Bash/SonoroScript
ls CatalogoSonoro > fileSonori.txt

while read -r riga; do
    file CatalogoSonoro/$riga | grep -E '44.1|44100' > temp.txt
    if [[ ! -s temp.txt ]]; then
        rm CatalogoSonoro/$riga
    fi
    rm temp.txt
    
done < fileSonori.txt
