#!/bin/bash

deletion() {

while [[ ok=0 ]]
do
    read -p "Numele fisierului din care doresti sa stergi cu ".csv": " file
    if [ -f $file ]
    then
      break;
    else
      clear
      echo "Fisierul nu exista"
    fi
done

echo "Ce ID doresti sa stergi?"
q=0 
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

temp="temp_file.csv"
echo "id,denumire,an,pret" > $temp

while IFS="," read -r id denumire an pret
do
    if [[ $id -ne $var ]]
    then
        echo "$id,$denumire,$an,$pret" >> $temp
    fi
done < <(tail -n +2 $file)

mv $temp $file

}
