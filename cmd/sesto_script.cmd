@echo off
setlocal enabledelayedexpansion

rem set days="Lunedì Martedì Mercoledì Giovedì Venerdì Sabato Domenica"
set numbers[0]=31
set numbers[1]=30
set numbers[2]=31
set numbers[3]=31
set numbers[4]=30
set counter=0
set index=0
for %%m in (maggio giugno luglio agosto settembre) do (
    echo %%m
    for /L %%j in (1, 1, !numbers[%index%]!) do (
        for %%i in (Lunedi Martedi Mercoledi Giovedi Venerdi Sabato Domenica) do (
            if !counter! LSS 31 (
                echo %%i !counter!
            )
            set /a counter+=1
        ) 
    )
    set /a index+=1 
)