LANG1="us"
LANG2="gr"

CURRENT_LANG=$(setxkbmap -query | grep "layout" | cut -f6 -d ' ')
if [ "$CURRENT_LANG" = $LANG1 ]; then
	setxkbmap $LANG2
else
	setxkbmap $LANG1
fi
