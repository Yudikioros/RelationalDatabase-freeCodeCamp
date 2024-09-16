#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAIN(){
  echo "Enter your username:"
  read USERNAME_INPUT

  USER_INFO=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME_INPUT'")

  IFS="|" read -r USERNAME GAMES_PLAYED BEST_GAME <<< $USER_INFO

  # if user doesn't exists
  if [[ -z $USERNAME ]]
  then
    echo "Welcome, $USERNAME_INPUT! It looks like this is your first time here."

    NUMBER_GUESS

    NEW_USER=$($PSQL "INSERT INTO users (username, games_played, best_game) VALUES('$USERNAME_INPUT', 1, $TRIES)")
  else
    # if user exists
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    NUMBER_GUESS

    GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))

    if [[ $TRIES -lt $BEST_GAME ]]
    then
      BEST_GAME=$TRIES
    fi

    NEW_USER=$($PSQL "UPDATE users SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE username = '$USERNAME'")
  fi
}

NUMBER_GUESS(){
  # generate random number (1-1000)
  RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))

  # counter for guess tries
  TRIES=0

  # read the user's guess
  echo "Guess the secret number between 1 and 1000:"
  read USER_NUMBER

  while [[ $USER_NUMBER -ne $RANDOM_NUMBER ]]
  do
    # increase the counter
    TRIES=$(( TRIES + 1 ))

    #if the input is a number
    if [[ $USER_NUMBER =~ ^[0-9]+$ ]]
    then
      #if the user's number is greater than
      if [[ $USER_NUMBER -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
        read USER_NUMBER
      else
        #if the user's number is lower than
        echo "It's higher than that, guess again:"
        read USER_NUMBER
      fi
    else
      #if the input is not a number
      echo "That is not an integer, guess again:"
      read USER_NUMBER
    fi
  done
  
  TRIES=$(( TRIES + 1 ))

  echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
}

MAIN