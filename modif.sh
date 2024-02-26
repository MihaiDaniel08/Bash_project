#!/bin/bash

modificare() {

while [[ ok=0 ]]
do
    read -p "Numele fisierului din care doresti sa modifici cu ".csv": " file
    if [ -f $file ]
    then
      break;
    else
      clear
      echo "Fisierul nu exista"
    fi
done

q=0
echo "Ce ID doresti sa modifici?" 
while [[ ok=0 ]]
do
  read var
  while IFS="," read -r id denumire an pret
  do
    if (( $var == $id ))
    then
       q=1
      break
    fi
  done < <(tail -n +2 $file)
  if (( $q == 1 ))
  then
     break
  fi
  echo -n "ID-ul nu exista incearca altul: "
done

k=88

while [ $k -ne 0 ]
do
    clear
    echo "1. Pentru a modifica denumirea"
    echo "2. Pentru a modifica anul"
    echo "3. Pentru a modifica pretul"
    echo "0. Back"
    
    read k

    case $k in
         1) echo "se modifica denumirea"
            temp="temp_file.csv" 
            echo "id,denumire,an,pret" > $temp ; 
            while [[ ok=0 ]]
              do
                  read -p "Denumirea noua: " denumire_noua
                  if [[ $denumire_noua =~ ^[a-zA-Z]+$ ]] #verif string
                  then 
                    break;
                  else
                    clear
                    echo "Invalid"
                  fi
              done
            awk -v id="$var" -v denumire="$denumire_noua" 'BEGIN {FS=OFS=","} $1==id {$2=denumire} 1' $file > $temp 
            mv $temp $file
            ;;
         2) echo "se modifica anul" 
            temp="temp_file.csv"
            echo "id,denumire,an,pret" > $temp
            while [[ ok=0 ]]
              do
                  read -p "Anul nou: " an_nou
                  if [[ $an_nou =~ ^(19[0-9]{2})$ || $an_nou =~ ^(20[0-1][0-9])$ || $an_nou =~ ^(2020|2021|2022|2023)$ ]]; #verif nr 1900-2023
                  then
                      break;
                  else
                      clear
                      echo "Invalid number" 
              fi
          done
            awk -v id="$var" -v an="$an_nou" 'BEGIN {FS=OFS=","} $1==id {$3=an} 1' $file > $temp
            mv $temp $file 
            ;;
         3) echo "se modifica pretul"
            temp="temp_file.csv"
            echo "id,denumire,an,pret" > $temp
            while [[ ok=0 ]]
              do
                  read -p "Pretul nou: " pret_nou
                  if [[ $pret_nou =~ ^[0-9]+(\.[0-9]+)?$ ]]; #verif nr real poz
                  then
                      clear
                      break;
                  else
                      echo "Invalid" 
              fi
          done
            awk -v id="$var" -v pret="$pret_nou" 'BEGIN {FS=OFS=","} $1==id {$4=pret} 1' $file > $temp
            mv $temp $file 
            ;;
         0) echo "Vei iesi din meniul de modificare..."; sleep 3 ;;
         *) echo "Aceasta optiune nu exista! Incearca din nou!" ; sleep 3 ;;
    esac


done

}