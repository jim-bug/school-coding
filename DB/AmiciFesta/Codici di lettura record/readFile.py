# Author: Ignazio Leonardo Calogero Sperandeo
# Date: 30/09/2024
# Project: Sperimentazione con file organizzati sequenzialmente in python
# by jim_bug :)

date = ["Nome: ", "Cognome: ", "Data: ", "Sesso: ", "Codice Fiscale: ", "Stato: ", "Regione: ", "Provincia: ", "Citta: ", "Residenza: ", "Civico: ", "CAP: ", "TEL: "]
with open("./Record_Cliente.txt", 'r') as file:
    for i in file:
        for z, j in zip(i.split('='), date):
            print(f"{j}{z}")
        