rem realizzare uno script che elimini le 7 cartelle create dallo script 1:
rem Realizzato da Ignazio

for %%i in (lun mar mer gio ven sab dom) do (
	cd \Users\Ignazio\Desktop
	cd %%i
	del * /Q
	cd ..
	rmdir %%i
)

rem /Q non chiede riconferma della rimozione dei file