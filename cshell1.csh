#!/bin/csh

echo "Enter a number:"

set number = $<

if ($number % 2 == 0) then
echo "The number $number is even"

else
echo "The number $number is odd"

endif
