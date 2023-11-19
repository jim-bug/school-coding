mkdir CatalogoMultimedialeHotelSanPalace 2>/dev/null
cd CatalogoMultimedialeHotelSanPalace

rm -r *
rm *
for ((i=0;i<50;i++)) do
    touch oggettoSpazio${i}.txt 2>/dev/null
    mkdir oggettoCartelle${i}
done
cd ..