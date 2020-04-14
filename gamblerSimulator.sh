#! /bin/bash
initialAmount=100
betPerGame=1
isWin=1
isLost=0
remainingMoney=0
maxAmount=150
minAmount=50
wonAmount=0
lostAmount=0
declare -A luckyDayCollection
declare -A unLuckyDayCollection
indexOfLuckyArray=0
indexOfUnLuckyArray=0
for(( i=1; $i<=20; i++ ))
	do
		while(true)
   		   do
			gameStatus=$((RANDOM%2))
			if [ $isWin -eq $gameStatus ]
			  then 
				wonAmount=$((wonAmount+1))
	   			initialAmount=$(($initialAmount+1))
			  else
				lostAmount=$((lostAmount+1))
	   			initialAmount=$(($initialAmount-1))
			fi
			if [ $initialAmount -gt $maxAmount ] || [ $initialAmount -lt  $minAmount ]
		   	  then 
				if [ $initialAmount -gt $maxAmount ]
					then
					    luckyDayCollection[ indexOfLuckyArray++ ]=$initialAmount
					else
					    unLuckyDayCollection[ indexOfUnLuckyArray++ ]=$initialAmount
			 	fi
				remainingMoney=$initialAmount
				initialMoney=100
				break;
			fi
   		   done
	done
echo "after 20 days remaining money is $remainingMoney"
echo "total amount won in this month is $wonAmount $ and lost $lostAmount $"
echo ${luckyDayCollection[@]}
echo ${unLuckyDayCollection[@]} 