#!/bin/csh

echo "Please enter a number between 1 and 10:"
set entry = $<

if ($entry < 1 || $entry > 10) then
	echo "error: number must be between 1 and 10."
	exit(1)
endif

set int = 2
set sum = 1
set factorial = 1

while ($int <= $entry)
	@ sum = $sum + $int
	@ int = $int + 1
end

echo "The sum is $sum"

while ($entry > 0)
	@ factorial = $factorial * $entry
	@ entry = $entry - 1
end

echo "The factorial is $factorial"
