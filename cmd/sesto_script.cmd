rem echo Calendario aprile maggio giugno 2023 > "Calendario.txt"

for %%i in (apr, magg, giugn) do (
    rem echo lun mar mer gio ven sab dom >> "Calendario.txt"
    for /L %%j in (1-1-30) do (
        echo %%j >> Calendario.txt
    ) 
)