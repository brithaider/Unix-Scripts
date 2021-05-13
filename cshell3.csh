#!/bin/csh

set score = $1

if ($score >= 90 && $score <= 100) then
	echo "You got A"
else if ($score < 90 && $score >= 80) then
	echo "You got B"
else if ($score < 80 && $score >= 70) then
	echo "You got C"
else if ($score < 70 && $score >= 60) then
	echo "You got D"
else if ($score < 60) then
	echo "You failed"
else
	echo "Error: Invalid entry"
endif
