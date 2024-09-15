#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN(){
  if [[ -z $1 ]]
  then
      echo "Please provide an element as an argument."
  else
    ELEMENT_INPUT=$1

    if [[ $ELEMENT_INPUT =~ ^[0-9]+$ ]]
    then
      ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT_INPUT")
      
      PRINT_INFO


    else
      if [[ $ELEMENT_INPUT =~ ^[A-Z]+[a-z]?$ ]]
        then
          ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$ELEMENT_INPUT' ")

          PRINT_INFO

        else
          ELEMENT_INFO=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$ELEMENT_INPUT' ")

          PRINT_INFO

        fi

    
    fi

  fi
}

PRINT_INFO(){
  IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $ELEMENT_INFO

  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
  else
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

MAIN $1