#!/bin/csh

# Present user with a menu of options for the phonebook. Loops until user exits with e or E input

set continue = 1
while ( $continue != 0 )
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

# Read in the user's choice, apply to switch case statement
echo "Enter your choice:"
set choice = $<
echo

# Option 1: Case statement uses "sort" command to sort alphabetically
# Option 2: sort -k flag with "2" sorts according to second field (last name)
# Option 3: -r flag reverses the order
# Option 4: combines -k and -r to reverse by last name
# Option 5: uses grep with -i flag so user can enter last name without case
#           restrictions, then searches for given pattern
# Option 6: user can enter birthyear in either YYYY or YY format, so use "tail"
#           to reassign varaiable with last two characters then search file for matching year using grep
# Option 7: Make it easy for users to enter birth month by asking for MM format. datebook.txt does not
#           follow this format, so use if statement to check for 0 as first number in MM. If true, then
#           cut the 0 and search file using grep.
# Option 8: Ask user for info for each field. Save entire string as variable with proper format
#	    to match datebook.txt. Then append to datebook.txt and sort the file.
# Option 9: prompt user for name or number, then search for match using grep. Ask user for 
#	    confirmation to delete. If confirmed, delete the line and print new sorted phonebook.
# Option 10: sorts the phonebook in alphabetical order then saves it to the datebook.txt file and exits.

switch ($choice)

	case '1':
		sort datebook.txt
		breaksw
	case '2':
		sort -k 2 datebook.txt
		breaksw
	case '3':
		sort -r  datebook.txt
		breaksw
	case '4':
		sort -k 2 -r datebook.txt
		breaksw
	case '5':
		echo "Enter last name:"
		set lastname = $<
		grep -i "$lastname" datebook.txt
		breaksw
	case '6':
		echo "Enter year of birth (YYYY) or (YY):"
		set birthyear = $<
		set birthyear = "`(echo $birthyear | tail -c 3)`"
		grep "[0-9[0-9]/$birthyear" datebook.txt
		breaksw
	case '7':
		echo "Enter month of birth (MM):"
		set birthmonth = $<
		if ( $birthmonth =~ 0[0-9] ) then
			set birthmonth = "`(echo $birthmonth | cut -c 2-)`"
		endif
		grep ":$birthmonth/" datebook.txt
		breaksw
	case '8':
		echo "Enter a first and last name separated by a space:"
                set name = "$<"
        	echo "Enter home phone number as xxx-xxx-xxxx:"
        	set homenumber = "$<"
        	echo "Enter mobile phone number as xxx-xxx-xxxx:"
        	set mobilenumber = "$<"
        	echo "Enter street address as 123 Street St.:"
        	set street = "$<"
        	echo "Enter city and state as New York, NY:"
        	set citystate = "$<"
        	echo "Enter 5 digit zip code:"
        	set zip = "$<"
        	echo "Enter Birth date as MM/DD/YYYY or M/D/YY:"
        	set birthdate = "$<"
        	echo "Enter salary with no symbols (ex. XXXXX):"
        	set salary = "$<"
       		set entry = "${name}:${homenumber}:${mobilenumber}:${street},  ${citystate} ${zip}:${birthdate}:${salary}"
        	echo $entry >> datebook.txt
        	echo
        	echo "New phonebook:"
        	echo
        	sort datebook.txt	
		breaksw
	case '9':
		echo "Search for a record by last name or mobile number. Mobile number must be entered as xxx-xxx-xxxx:"
		set field = "$<"
		grep -i "$field" datebook.txt
		echo "Is this the correct entry? Enter Y or N:"
		set confirm = "$<"
		if ( $confirm == "Y" ) then
			set line = "`(grep -i "$field" datebook.txt)`"
			grep -v "$line" datebook.txt > datebook.txt.tmp && mv datebook.txt.tmp datebook.txt
		else if ( $confirm == "N" ) then
			echo "Process cancelled."
		endif
		echo
		echo "New phonebook:"
		echo
		sort datebook.txt
		breaksw
	case '10':
		echo "The phonebook has been sorted and saved. Goodbye!"
		sort -n -o datebook.txt datebook.txt
		exit(0)
		breaksw
	case 'e':
		echo "Goodbye!"
		exit(0)
		breaksw
	case 'E':
		echo "Goodbye!"
		exit(0)
		breaksw
	default:
		echo "Sorry, $choice is not a valid option. Check entry and try again."
		breaksw
endsw

end

