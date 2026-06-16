PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT e.atomic_number,e.symbol,e.name,p.atomic_mass,p.melting_point_celsius,p.boiling_point_celsius,t.type FROM elements e INNER JOIN properties p ON e.atomic_number=p.atomic_number INNER JOIN types t ON t.type_id=p.type_id WHERE p.atomic_number=$1;")
  elif [[ ${#1} -le 2 ]]
  then
    ELEMENT=$($PSQL "SELECT e.atomic_number,e.symbol,e.name,p.atomic_mass,p.melting_point_celsius,p.boiling_point_celsius,t.type FROM elements e INNER JOIN properties p ON e.atomic_number=p.atomic_number INNER JOIN types t ON t.type_id=p.type_id WHERE symbol='$1';")
  else
    ELEMENT=$($PSQL "SELECT e.atomic_number,e.symbol,e.name,p.atomic_mass,p.melting_point_celsius,p.boiling_point_celsius,t.type FROM elements e INNER JOIN properties p ON e.atomic_number=p.atomic_number INNER JOIN types t ON t.type_id=p.type_id WHERE name='$1';")
  fi
  if [[ $ELEMENT ]]
  then
    echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  else
    echo "I could not find that element in the database."
  fi
else
   echo "Please provide an element as an argument."
fi