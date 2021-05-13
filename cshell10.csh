#!/bin/csh

set num1 = $1
set num2 = $2
set cont = 0


while ($cont != "1")
echo "Choose an option:"
echo "Add the numbers (enter A or a)"
echo "Subtract the numbers (enter S or s)"
echo "Multiply the numbers (enter M or m)"
echo "Divide the numbers (enter D or d)"
echo "Exit the program (enter E or e)"

set choice = $<

switch ($choice)
	case "A":
		@ sum = $num1 + $num2
		echo "The sum of $num1 and $num2 is $sum"
		breaksw
	case "a":
		@ sum = $num1 + $num2
		echo "The sum of $num1 and $num2 is $sum"
		breaksw
	case "S":
		@ difference = $num1 - $num2
		echo "The difference of $num1 and $num2 is $difference"
		breaksw
	case "s":
		@ difference = $num1 - $num2
		echo "The difference of $num1 and $num2 is $difference"
		breaksw
	case "M":
		@ product = $num1 * $num2
		echo "The product of $num1 and $num2 is $product"
		breaksw
	case "m":
		@ product = $num1 * $num2
		echo "The product of $num1 and $num2 is $product"
		breaksw
	case "D":
		@ quotient = $num1 / $num2
		echo "The quotient of $num1 and $num2 is $quotient"
		breaksw
	case "d":
		@ quotient = $num1 / $num2
		echo "The quotient of $num1 and $num2 is $quotient"
		breaksw
	case "E":
		echo "Goodbye!"
		exit(1)
	case "e":
		echo "Goodbye!"
		exit(1)
	default:
		echo "Error: not a valid choice. Please try again."
		breaksw
endsw

echo "Make a new choice:"
echo "New operation on same integers (enter 1)"
echo "Start over with new integers (enter 2)"
echo "Exit the program (enter E or e)"

set choice = $<
switch ($choice)
case "1":
	breaksw
case "2":
	echo "Enter two new positive integers:"
	set num1 = $<
	set num2 = $<
	breaksw
case "E":
	echo "Goodbye!"
	exit(1)
	breaksw
case "e":
	echo "Goodbye!"
	exit(1)
	breaksw
default:
	echo "Please try again."
endsw




end
