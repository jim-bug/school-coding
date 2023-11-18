mkdir CatalogoMultimedialeHotelSanPalace 2>/dev/null
cd CatalogoMultimedialeHotelSanPalace
rm *
for ((i=0;i<50;i++)) do
    touch fil${i}.txt 2>/dev/null
done
cd ..