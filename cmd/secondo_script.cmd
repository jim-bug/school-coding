rem realizzare uno script che in base all'output del precedente, entra in ogni file creato e aggiunga a capo un saluto.
rem Realizzato da Ignazio Sperandeo

for %%i in (lun mar mer gio ven sab dom) do (
	cd \Users\Ignazio\Desktop
	cd %%i  
	echo SALUTO A TUTTI VOI >> "FILE{%%i}.txt"
	cd ..
)