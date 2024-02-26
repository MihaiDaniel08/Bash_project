#!/bin/bash

afis() {

while [[ ok=0 ]]
do
    read -p "Numele fisierului pe care doresti sa il afisezi:" file
    if [ -f $file ]
    then
      break;
    else
      echo "Fisierul nu exista"
    fi

done


while IFS="," read -r id denumire an pret
do
 echo "ID: $id"
 echo "Denumire: $denumire"
 echo "An: $an"
 echo "Pret: $pret"
 echo "----------------------"
done < <(tail -n +2 $file)

}
