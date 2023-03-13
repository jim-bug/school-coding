rem realizzare uno scritpt che crei 7 cartelle con i nomi dei giorni utlizzando 3 caratteri. Successivamente dentro ogni cartella mettere un file di testo con dentor il nome del giorno:
rem Realizzato da Ignazio Sperandeo.

for %%i in (lun mar mer gio ven sab dom) do (
	cd \Users\Ignazio\Desktop
	mkdir %%i	
	cd %%i		
	echo %%i > "FILE{%%i}.txt"	
	cd ..	
)