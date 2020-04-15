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
winDaysCounter=0
lostDaysCounter=0
declare -A luckyDayCollection
declare -A unLuckyDayCollection
indexOfLuckyArray=0
indexOfUnLuckyArray=0

luckiestUnluckiestDay(){

	max="$1"
	min="$2"

	for((l=1;l<${#luckyDayCollection[@]};l++))
	do
		if [ $max -lt ${luckyDayCollection[$l]} ]
		then
			max=${luckyDayCollection[$l]}
		fi

		if [ $min -gt ${unLuckyDayCollection[$l]} ]
		then
			min=${unLuckyDayCollection[$l]}
		fi
	done

	echo "Luckiest day: $max"
	echo "Unluckiest day: $min"
}

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
					    $winDaysCounter++
					    $luckyDayCollection[ indexOfLuckyArray++ ]=$initialAmount
					else
					    lostDaysCounter++
					    unLuckyDayCollection[ indexOfUnLuckyArray++ ]=$initialAmount
			 	fi
				remainingMoney=$initialAmount
				initialMoney=100
				break;
			fi
   		   done
	done

if [ wonAmount -gt lostAmount ]
	then
	    echo "You have won most of the days....u can play next month"
	else
	    echo "you have lost most of the days...u better stop playing next playing"
fi

echo ${luckyDayCollection[@]}
echo ${unLuckyDayCollection[@]} 

echo "total amount won in this month is $wonAmount $ and lost $lostAmount $"

luckiestUnluckiestDay $luckiestDayCollection $unLuckyDayCollection