rem Realizzare un programma che crei 100 cartelle

for /L %%i in (0, 1, 99) do (
    mkdir "CARTELLA_%%i"
)