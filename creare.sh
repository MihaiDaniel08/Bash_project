#!/bin/bash

creare() {

echo "Creeaza un fisier csv cu id, denumire, an , pret:"

read -p "Introduceti numele fisierului pe care doriti sa il creati: " file

echo "id,denumire,an,pret" > $file

string="_id.csv"
file="${file/.csv/"$string"}" #test.csv --> test_id.csv

echo "1" >> $file

}
