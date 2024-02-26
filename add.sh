#!/bin/bash

adaugare() {

while [[ ok=0 ]]
do
    read -p "Numele fisierului in care doresti sa adaugi cu ".csv":" file
    if [ -f $file ]
    then
      break;
    else
      clear
      echo "Fisierul nu exista"
    fi
done

string="_id.csv"
string="${file/.csv/"$string"}"
id=$(cat "$string")
echo "ID-ul autogenerat este: " $id

while [[ ok=0 ]]
    do
        read -p "Introdu denumirea:" denumire
        if [[ $denumire =~ ^[a-zA-Z]+$ ]] #verif string
        then 
          break;
        else
          clear
          echo "Invalid"
        fi
done

while [[ ok=0 ]]
    do
        read -p "Introdu anul:" an
        if [[ $an =~ ^(19[0-9]{2})$ || $an =~ ^(20[0-1][0-9])$ || $an =~ ^(2020|2021|2022|2023)$ ]]; #verif nr 1900-2023
        then
            break;
        else
            clear
            echo "Invalid number" 
    fi
done

while [[ ok=0 ]]
    do
        read -p "Introdu pretul:" pret
        if [[ $pret =~ ^[0-9]+(\.[0-9]+)?$ ]]; #verif nr real poz
        then
            clear
            break;
        else
            echo "Invalid" 
    fi
done

echo "$id,$denumire,$an,$pret" >> $file

id=$(expr $id + 1)
echo "$id" > $string

echo -e "\n"

}