#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games;")
echo $($PSQL "TRUNCATE TABLE teams CASCADE;")
echo $($PSQL "SELECT SETVAL('games_game_id_seq', 1, false);")
echo $($PSQL "SELECT SETVAL('teams_team_id_seq', 1, false);")
echo $($PSQL "INSERT INTO teams(name) VALUES('Algeria'),('Argentina'),('Belgium'),('Brazil'),('Chile'),('Colombia'),('Costa Rica'),('Croatia'),('Denmark'),('England'),('France'),('Germany'),('Greece'),('Japan'),('Mexico'),('Netherlands'),('Nigeria'),('Portugal'),('Russia'),('Spain'),('Sweden'),('Switzerland'),('United States'),('Uruguay');")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$( $PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$( $PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    echo $( $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
  fi
done
