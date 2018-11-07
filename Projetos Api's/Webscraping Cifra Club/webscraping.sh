#!/bin/bash

#pegando as primeiras músicas
#curl -s $1 | hxnormalize -x | grep "art_music-link" | grep "/" | cut -d"/" -f2,3 > cif
curl -s $1 | grep "art_music-link" | grep "href" | cut -d"/" -f2-3 > cif;
#pegando as cifras
echo "--------------------------"
echo "Baixando"
cat cif | while read a; do
b="$(echo $a | cut -d"/" -f2)";
curl -s "https://www.cifraclub.com.br/$a/" | hxnormalize -x |hxselect "div.p402_premium"  | lynx -stdin -dump > $b.txt;
echo "--------------------------"
echo "convertendo..."
enscript -p $b.pdf $b.txt
echo "------- $b";
rm $b.txt

done;
rm cif
