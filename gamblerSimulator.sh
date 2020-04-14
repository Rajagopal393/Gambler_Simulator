#! /bin/bash
initialAmount=100
betPerGame=1
gameStatus=$((RANDOM%2))
isWin=1
isLost=0
remainingMoney=0
maxAmount=150
minAmount=50
for(( i=1; $i<=20; i++ ))
	do
		while(true)
   		   do
			if [ $isWin -eq $gameStatus ]
			  then 
	   			initialAmount=$(($initialAmount+1))
			  else
	   			initialAmount=$(($initialAmount-1))
			fi
			if [ $initialAmount -gt $maxAmount ] || [ $initialAmount -le $minAmount ]
		   	  then
				remainingMoney=$initialAmount
				initialMoney=100
				break;
			fi
   		   done
	done
echo "after 20 days remaining money is $remainingMoney"