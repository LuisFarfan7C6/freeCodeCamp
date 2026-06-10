#! /bin/bash                                                               

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"

SERVICE_MENU(){
  SERVICES=$($PSQL "select service_id, name from services order by service_id asc")
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
}

SERVICE_MENU

read SERVICE_ID_SELECTED
if [[ ! $SERVICE_ID_SELECTED =~ ^[1-3]+$ ]]
then
  echo -e "\nI could not find that service. What would you like today?\n"
  SERVICE_MENU
else
  echo -e "\nWhat's your phone number?\n"
  read CUSTOMER_PHONE
  PHONE_VALIDATION=$($PSQL "select * from customers where phone='$CUSTOMER_PHONE'")
  if [[ -z $PHONE_VALIDATION ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?\n"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?\n"
    read SERVICE_TIME
    echo $($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
    echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi 
fi
