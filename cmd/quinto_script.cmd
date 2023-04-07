rem Realizzare un programma che elimini 99 cartelle

for /L %%i in (0, 1, 98) do (
    rmdir "CARTELLA_%%i"
)