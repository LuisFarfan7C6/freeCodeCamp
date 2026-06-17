#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only --no-align -c"

echo "Enter your username:"
read USERNAME

#Validate the username in the database
USER_DATA=$($PSQL "SELECT user_id, username FROM users WHERE username='$USERNAME';")
if [[ $USER_DATA ]]
then
  echo $USER_DATA | while IFS="|" read USER_ID DB_USERNAME
  do
    GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(game_guesses) FROM games WHERE user_id=$USER_ID")
    echo "Welcome back, $DB_USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
fi

#Generate the secret number
SECRET_NUMBER=$((RANDOM % (1000 - 1 + 1) + 1))
echo $SECRET_NUMBER

echo "Guess the secret number between 1 and 1000:"
read USER_NUMBER

COUNT=1

if [[ $USER_NUMBER =~ ^[0-9]+$ ]]
then
  while [ $USER_NUMBER -ne $SECRET_NUMBER ]
  do
    ((COUNT++))
    if [[ $USER_NUMBER > $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
      read USER_NUMBER
    elif [[ $USER_NUMBER < $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
      read USER_NUMBER
    fi  
  done
  echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  INSERT_GAME=$($PSQL "INSERT INTO games(user_id,game_guesses) VALUES($USER_ID,$COUNT)")
else
  echo "That is not an integer, guess again:"
  read $USER_NUMBER
fi
