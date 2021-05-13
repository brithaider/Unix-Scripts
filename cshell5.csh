#!/bin/csh

echo "Enter a color:"

set color = $<

switch ($color)
case "bl*":
	echo "The sky is $color"
	breaksw
case "Bl*":
	echo "The sky is $color"
	breaksw
case "red":
	echo "The sun is sometimes this color."
	breaksw
case "yellow":
	echo "The sun is sometimes this color."
	breaksw
default:
	echo "The color is not in any of the defined categories"
endsw
