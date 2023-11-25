percorso="/home/jim_bug/school-coding/Bash/SonoroScript/CatalogoSonoro"
cd Lavoro/Privato/CatalogoSonoro
file * | grep -E '44100 Hz|44.1 kHz' | cut -d: -f1 | xargs -I {} sshpass -p "Ignazio" scp {} jim_bug@loffice:$percorso
