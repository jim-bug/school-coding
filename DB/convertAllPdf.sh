#!/bin/bash
# Author: Ignazio Leonardo Calogero Sperandeo
# Date: 06/10/2024
# Project: a script converts all .odt files to .pdf files

rm ./pdf/* 2>/dev/null
find . -type f -name "*.odt" -exec libreoffice --convert-to pdf --outdir ./pdf {} \;
