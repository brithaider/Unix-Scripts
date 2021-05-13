#!/bin/bash

###### Functions #####

# use sort to print out the contents of datebook.txt in alphabetical order by first name
option1()
{
	sort datebook.txt
}

# k option with value of 2 allows to sort by last name instead of first, with space as delimiter and "2" as field selector
option2()
{
	sort -k 2 datebook.txt
}

# r option reverses the alphabetical order 
option3()
{
	sort -r datebook.txt
}

# combine k and r to print out contents of datebook.txt in reverse alphabetical order by last name
option4()
{
	sort -k 2 -r datebook.txt
}

# prompt user for last name, then use grep to search for matching lines
option5()
{
	echo "Enter last name:"
        read lastname
        grep -i "$lastname" datebook.txt
}

# allow users to enter year as YYYY or YY. Use tail to get the last two numbers and reassign variable.
# Then use grep to search for matching lines
option6()
{
	echo "Enter year of birth (YYYY) or (YY):"
        read birthyear
        birthyear="$(echo $birthyear | tail -c 3)"
        grep "[0-9][0-9]/$birthyear" datebook.txt
}

# easier for user to enter month as MM, datefile.txt does not follow this.
# so if the entered number starts with 0, cut it. Then use grep to search for matching lines.
option7()
{
	echo "Enter month of birth (MM):"
        read birthmonth
        if [[ $birthmonth =~ ^0 ]]
        then
        	birthmonth="$(echo $birthmonth | cut -c 2-)"
        fi
        grep ":$birthmonth/" datebook.txt
}

# ask user for info for each field. Save entire string as variable with proper format to match
# datebook.txt. Then append to datebook.txt and sort the file.
option8()
{
	echo "Enter a first and last name separated by a space:"
	read name
	echo "Enter home phone number as xxx-xxx-xxxx:"
	read homenumber
	echo "Enter mobile phone number as xxx-xxx-xxxx:"
	read mobilenumber
	echo "Enter street address as 123 Street St.:"
	read street
	echo "Enter city and state as New York, NY:"
	read citystate
	echo "Enter 5 digit zip code:"
	read zip
	echo "Enter Birth date as MM/DD/YYYY or M/D/YY:"
	read birthdate
	echo "Enter salary with no symbols (ex. XXXXX):"
	read salary

	entry=""$name":"$homenumber":"$mobilenumber":"$street",  "$citystate" "$zip":"$birthdate":"$salary""
	echo $entry >> datebook.txt
	echo
	echo "New phonebook:"
	echo
	sort datebook.txt
}

# prompt user for name or number, then search for match using grep. Ask user for confirmation
# to delete. If confirmed, delete the line and print new sorted phonebook.
option9()
{
	echo "Search for a record by last name or mobile number. Mobile number must be entered as xxx-xxx-xxxx:"
	read field
	grep -i "$field" datebook.txt
	echo "Is this the correct entry? Enter Y or N:"
	read confirm
	if [[ $confirm -eq "Y" ]]
	then
		line=$(grep -i "$field" datebook.txt)
		grep -v "$line" datebook.txt > datebook.txt.tmp && mv datebook.txt.tmp datebook.txt
	elif [[ $confirm -eq "N" ]]
	then
		echo "Process cancelled."
	fi
	echo
	echo "New phonebook:"
	echo
	sort datebook.txt
}

# sorts the phonebook in alphabetical order then saves it to the datebook.txt file and exits.
option10()
{
	echo "The phonebook has been sorted and saved. Goodbye!"
	sort -n -o datebook.txt datebook.txt
	exit
}

##### End functions section, begin main program area #####

# Present user with a menu of options for the phonebook. Loops until user exits with e or E input

while true; do
echo
echo "|--------------------------Phonebook Menu--------------------------|"
echo "|Choose an option (E or e to exit):                                |"
echo "| 1. List all records in alphabetical order by FIRST NAME          |"
echo "| 2. List all records in alphabetical order by LAST NAME           |"
echo "| 3. List all records in REVERSE alphabetical order by FIRST NAME  |"
echo "| 4. List all records in REVERSE alphabetical order by LAST NAME   |"
echo "| 5. Search for a record by LAST NAME                              |"
echo "| 6. Search for a record by birth YEAR                             |"
echo "| 7. Search for a record by birth MONTH                            |"
echo "| 8. Add a new entry to the phonebook                              |"
echo "| 9. Delete a record from the phonebook                            |"
echo "| 10. Sort and save records to phonebook, then exit                |"
echo "|--------------------------**************--------------------------|"

# Read in the user's choice, apply to case statement
echo "Enter your choice:"
read choice
echo 
  
case $choice in

	1)
		option1
		;;
	2)
		option2
		;;
	3)
		option3
		;;
	4)
		option4
		;;
	5)
		option5
		;;
	6)
		option6			
		;;
	7)
		option7
		;;
	8)
		option8
		;;
	9)
		option9
		;;
	10)
		option10
		;;
	e)
		echo "Goodbye!"
		exit
		;;
	E)
		echo "Goodbye!"
		exit
		;;
	
	*)
		echo "Sorry, $choice is not a valid option. Check entry and try again."
		;;
esac
done


