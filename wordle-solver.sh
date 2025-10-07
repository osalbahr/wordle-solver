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

	echo -n 'Grays: '
	read GRAYS
	
	echo -n 'Guess = '
	grep -Ei '^[A-Z]{5}$' words.txt | grep -Ei "$GREENS" | grep -vEi "[$GRAYS]" | head -1
done
