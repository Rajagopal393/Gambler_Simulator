#! /bin/bash
initialAmount=100
betPerGame=1
gameStatus=$((RANDOM%2))
isWin=1
isLost=0
if [ $isWin -eq $gameStatus ]
	then 
	   echo "You Won The Game this time"
	else
	   echo "You Lost The Game.."
fi