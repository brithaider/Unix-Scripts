#!/bin/csh


while ({1})
	
	echo "Are you OK?"
	set answer = $<

	if ($answer == "Y" || $answer == "y") then
		echo "Glad to hear it"
		exit(1)
	else if ($answer == "N" || $answer == "n") then
		echo "Sorry that you are not feeling good"
		exit(1)
	else
		echo "$answer is not a valid option. Please try again."
end

