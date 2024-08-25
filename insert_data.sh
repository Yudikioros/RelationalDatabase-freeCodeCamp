#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
  echo $($PSQL "TRUNCATE  games, teams")
  echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")
  echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
  do
    if [[ $YEAR != year ]]
    then
      #Get team id
      TEAM_ID_1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      # if not found
      if [[ -z $TEAM_ID_1 ]]
      then
        # insert team
        echo $($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      fi

      if [[ -z $TEAM_ID_2 ]]
      then
        # insert team
        echo $($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      fi

      echo "INSERTING GAMES"

      #Get team id
      TEAM_ID_1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

      # insert rows in games
      echo $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $TEAM_ID_1, $TEAM_ID_2, $WINNER_G, $OPPONENT_G)")

    fi


  done
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
  echo $($PSQL "TRUNCATE  games, teams")
  echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")
  echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")
  cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_G OPPONENT_G
  do
    if [[ $YEAR != year ]]
    then
      #Get team id
      TEAM_ID_1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")
      # if not found
      if [[ -z $TEAM_ID_1 ]]
      then
        # insert team
        echo $($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      fi

      if [[ -z $TEAM_ID_2 ]]
      then
        # insert team
        echo $($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      fi

      echo "INSERTING GAMES"
      
      #Get team id
      TEAM_ID_1=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")
      TEAM_ID_2=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")

      # insert rows in games
      echo $($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $TEAM_ID_1, $TEAM_ID_2, $WINNER_G, $OPPONENT_G)")

    fi


  done
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
