#!/bin/sh
# Polls the X selection (clipboard)

while :; do

PNEW="$(xclip -o -sel primary 2>/dev/null)"

[ -n "$PNEW" ] && [ "$PNEW" != "$POLD" ] && {
	#empty

	POLD="$PNEW"
}

sleep .7
done
