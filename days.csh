#!/bin/csh

set days = ($argv)
set i = 0
 
while ($i < 7)
	echo $days
	shift days
	@ i++
end
