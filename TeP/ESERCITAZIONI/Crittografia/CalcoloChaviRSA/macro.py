# Author: Ignazio Leonardo Calogero Sperandeo
# Date: 09/10/2024
# Project: Macro to compute RSA keys with libreoffice calc
# by jim_bu // :)

from random import randint
import uno

def find_prime():
	ctx = uno.getComponentContext()
	smgr = ctx.ServiceManager
	desktop = smgr.createInstanceWithContext("com.sun.star.frame.Desktop", ctx)
	doc = desktop.getCurrentComponent()
	
	if not doc:
		return
	sheet = doc.Sheets.getByIndex(0)
	z = sheet.getCellByPosition(3, 1).Value
	
	c = 3
	while True:
		pri = randint(2, z)
		prime = True
		if pri < 2 or pri % 2 == 0 or pri % 3 == 0:
			continue
		if pri == 2 or pri == 3:
			break
		while c <= (pri**0.5):
			if pri % c == 0:
				prime = 0
				break
			c += 2
		else:
			if prime:
				break
	result_cell = sheet.getCellByPosition(5, 1)
	result_cell.Value = pri

# // :) 
