#!/bin/bash

sortare(){


while [[ ok=0 ]]
do
    read -p "Numele fisierului din care doresti sa sortezi cu ".csv": " file
    if [ -f $file ]
    then
      break;
    else
      clear
      echo "Fisierul nu exista"
    fi
done

j=420

while [ $j -ne 0 ]
do
  if [ $j -ne 4 ]
  then
    if [ $j -ne 5 ]
    then
    clear
    fi
  fi
    echo "In functie de ce vrei sa sortezi documentul?"
    echo "1. Dupa nume alfabetic"
    echo "2. Dupa anul de fabricatie"
    echo "3. Dupa pretul masinii"
    echo "4. Afisarea celei mai ieftine masini"
    echo "5. Afisarea celei mai scumpe masini"
    echo "0. Back"

    read j

    case $j in 
    1) echo "Se va crea un nou document CSV cu datele sortate...";  head -n 1 $file > sortari/sortat_alfabetic.csv ; tail -n +2 $file | sort -t"," -k2  >> sortari/sortat_alfabetic.csv ; echo "Documentul a fost creat cu succes!"; sleep 3 ;;
    2) echo "Se va crea un nou document CSV cu datele dortate..."; head -n 1 $file > sortari/sortat_an.csv ; tail -n +2 $file | sort -t"," -k3,3n >> sortari/sortat_an.csv ; echo "Documentul a fost creat cu succes!" ; sleep 3 ;;
    3) echo "Se va crea un nou document CSV cu datele dortate..."; head -n 1 $file > sortari/sortat_pret.csv ; tail -n +2 $file | sort -t"," -k4,4n >> sortari/sortat_pret.csv ; echo "Documentul a fost creat cu succes!" ; sleep 3 ;;
    4) echo "Se va afisa in terminal cea mai ieftina masina..."; sleep 2 ; clear ; tail -n +2 $file | sort -t"," -k4,4n | head -n 1 ;;
    5) echo "Se va afisa in terminal cea mai scumpa masina..."; sleep 2 ; clear ; tail -n +2 $file | sort -t"," -k4,4n | tail -n 1 ;;
    0) echo "Vei iesi din meniul de sortare..."; sleep 3 ;;
    *) echo "Aceasta optiune nu exista! Incearca din nou!" ; sleep 3 ;;
    esac

done

}
