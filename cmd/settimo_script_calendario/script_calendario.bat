rem Fatto da Ignazio Leonardo Calogero Sperandeo
rem Consegna: fare un script di shell ( a scelta: cmd.exe per windows, bash per linux) che calcoli il giorno Giuliano (Julian day) di una data a scelta o di sistema e mostri a schermo il calendario del mese di partenza e dei due mesi successivi.
@echo off
rem attraverso questo comando posso usare, per visualizzare i contenuti delle variabili modificati, !var!
setlocal enabledelayedexpansion

set day=1
set month=%date:~3,-5%
set year=%date:~6%
if %month% LSS 09 (
	set /a "month=%month:~1%"
)
set /a "julian=%day%+(153*%month%+2)/5+%year%*365+%year%/4-%year%/100+%year%/400-32045"
rem trovo il giorno della settimana
set /a "day_week=%julian% %% 7"
set n_mesi=3
set counter=1

mkdir Calendario
cd Calendario
for /L %%i in (1,1,%n_mesi%) do (
	rem determino il numero massimo di giorni
	if !month! == 11 (
		set max=30
	) else if !month! == 4 (
		set max=30
	) else if !month! == 6 (
		set max=30
	) else if !month! == 9 (
		set max=30
	) else if !month! == 2 (
		set max=28
	) else (
		set max=31
	)

	echo Mese: !month! > Mese_!month!.txt
	echo DO LU MA ME GI VE SA >> Mese_!month!.txt
	rem scrivo # per sui giorni in cui non inizia il mese
	for /L %%k in (1, 1, !day_week!) do (
		echo | set /p="#  ">> Mese_!month!.txt
	)
	
	rem variabile che mi indica quanti giorni mancano alla fine della prima settimana
	set /a "mv=7-!day_week!"
	for /L %%j in (1, 1, !max!) do (
		if %%j LEQ !mv! (
			echo | set /p=%%j  >> Mese_!month!.txt
			if %%j EQU !mv! (
				echo.>> Mese_!month!.txt
			)
		) else (
			set /a "control=!counter! %% 7"
			if !control! EQU 0 (
				if %%j GTR 9 (
					echo | set /p=%%j >> Mese_!month!.txt
					echo.>> Mese_!month!.txt
				) else (
					echo | set /p=%%j  >> Mese_!month!.txt
					echo.>> Mese_!month!.txt
				)
				set /a "counter=0"
			) else (
				if %%j GTR 9 (
					echo | set /p=%%j >> Mese_!month!.txt
				) else (
					echo | set /p=%%j  >> Mese_!month!.txt
				)
			)
			set /a "counter+=1"
		)
	)
	if !month! EQU 12 (
		set month=1
		set /a "year+=1"
	) else (
		set /a "month+=1"
		set /a "julian=%day%+(153*!month!+2)/5+!year!*365+!year!/4-!year!/100+!year!/400-32045"
		set /a "day_week=!julian! %% 7"
	)
	set counter=1
)
endlocal
