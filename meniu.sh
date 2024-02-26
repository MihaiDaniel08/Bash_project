#!/bin/bash

. afis.sh
. add.sh
. creare.sh
. delete.sh
. sort.sh
. modif.sh

meniu() {

i=69

while [ $i -ne 0 ]
do
 
 if [ $i -ne 4 ] 
 then
  clear
 fi
  
   echo "1. Pentru creare"
   echo "2. Pentru adaugare inregistrare"
   echo "3. Pentru stergere"
   echo "4. Pentru afisare"
   echo "5. Pentru modificare"
   echo "6. Pentru sortare"
   echo "0. EXIT"

   read i
   
   case $i in
   1) creare ;;
   2) adaugare ;;
   3) deletion ;;
   4) clear; afis ;;
   5) modificare ;;
   6) sortare ;;
   0) echo "Am iesit!" ;;
   *) echo "Aceasta optiune nu exista! Incearca din nou!" ; sleep 3 ;;
   esac

done

}

