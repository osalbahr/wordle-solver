#!/usr/bin/env bash

trap quit SIGINT
quit() {
	exit
}

echo -n 'Guess = '
grep -Ei '^[A-Z]{5}$' words.txt | head -1

while :
do
	echo

	echo -n 'Greens: '
	read GREENS
	cmd='grep -Ei ^[A-Z]{5}$ words.txt | grep -Ei '$GREENS

	echo -n 'Grays: '
	read GRAYS
	cmd=$cmd' | grep -vEi ['$GRAYS']'

	echo -n 'Yellows: '
	read YELLOWS
	if ! [ -z $YELLOWS ]
	then
		for ch in $(echo $YELLOWS | grep -o .)
		do
			cmd=$cmd' | grep '$ch
		done
	fi

	echo -n 'Guess = '
	eval "$cmd | head -1"
done
