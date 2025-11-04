#!/bin/bash
# 1) delaire all needed variables
# 2) define all functions
# 3) start main logic
data_directory="./data"
random_array_of_items=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
pause(){
	read -n 1 -s -r -p "press any key to  continue"
	echo
}
check_for_directory(){
	#this function checks for a directory called /data
	#if the directory does not exist it creates one
if [ ! -d "$data_directory" ]; then
	mkdir "$data_directory"
fi
}

   
display_menu_options(){
	# prints all menu options for the user
	echo " 
	1. View all items
	2. View an item by position
	3. Add a new word
	4. Delete the last word
	5. Delete a word by position
	6. Save curerent Box
	7. Load a saved box
	8. List saved boxes
	9. Exit
	"
	# reads user input  and stores it in variable to direct them to the correct function

    read -p "Choose an option (1-8): " function_choice
    check_user_input
}





check_user_input(){
	# using the variable from display_menu_options
	#it matches the number 1-9 to take them to the correct fnction
	#if the user writes anything other than what is written here in th case function
	#it will run the display_menu_options again in a recursional way using *
	case  $function_choice in
		1|one)	
			print_all_items
			;;
		2)
			print_item_at_x_position
			;;
		3)
			print_new_item
			;;
		4)
		 	unset_last_item
			;;
		5)
			delete_word_by_position
			;;
		
		6)
			save_box
			;;
		7)
			load_box
			;;
		8)
			list_boxes
			;;
		9|exit)
			exit_script
			;;
		*)
			display_menu_options
			;;
	esac
}

print_all_items(){
	#this function just prints all items in the array
	echo "${random_array_of_items[@]}"
	pause
	display_menu_options
}
print_item_at_x_position(){
	# this function stores the number the user inputs in a variable
	#then it matches it with a number on the array and prints that word
	read -p "Please enter position 0-9 : " position_of_word
			echo "Item at $position_of_word is: ${random_array_of_items[$position_of_word]}"
			pause
			display_menu_options
}
print_new_item(){
	#this function stores the input of the user and puts it in a variable
	#then it adds it to the list 
	# then it echos thhe list a
	read -p "Please choose a word to add to the list: " user_word
			 random_array_of_items+=("$user_word")
			echo "${random_array_of_items[@]}"
			echo "your word '$user_word' has been added to the list"
			pause
			display_menu_options
}
unset_last_item(){
	#unset is  command that takes off an item
	#i call random_array_of_items
	#i tell the computer to get rid of 1 item using [-1]
	unset 'random_array_of_items[-1]'
			echo "final item removed"
			echo "${random_array_of_items[@]}"
			pause
			display_menu_options
}
delete_word_by_position(){
	#this function mathces the user_word_delete which is a number with the array and unsets the corresponding word
	# then it echos the updated list and a confirmation
	read -p "choose The position of the word you want to delete: " user_word_delete
			unset "random_array_of_items[$user_word_delete]"
			echo "${random_array_of_items[@]}"
			pause
			display_menu_options
}
save_box(){

	read -p " What would you like to name this save file?: " user_save_file_name
	# creates full filepath by adding the data_directory (data/) and the user input in user_save_file_name
	# for example the full filepath could be data/test.box
	filepath="$data_directory/$user_save_file_name.box"
{
# creates a save file to put the current array so the computer doesnt forget the list
#when the script stops and saves it to the filepath eg. data/text.box and confirms
echo "saved_items=(${random_array_of_items[@]@Q})"
} > "$filepath"
echo "Box saved to $filepath"
}
load_box(){
	# a new filepath is created depending on the user_load_box eg. data/test123
	#then it is checked wether the filepath exists if it does using source the file is written in the current position\
	read -p "please write the name of the box you would load: " user_load_box
	filepath="$data_directory/$user_load_box.box"
	if [ -f "$filepath" ]; then
		source "$filepath"
		random_array_of_items=("${saved_items[@]}")
		# this line switches the variable back from saved_items to random_array_of_items 
		echo " ' $user_load_box ' loaded "
		echo "current items: ${random_array_of_items[@]}"
		pause
	else
		echo "Invalid filename"
		pause
	fi
	# if the filepath the user entered does not exist it printd that the filename is invalid
	display_menu_options
}
list_boxes() {
	# this function checks for all files in data/ ending with .box and if there are files it prints it
	echo "saved boxes:"
	for file in "$data_directory"/*.box; do
		if [ -f "$file" ]; then
			echo "$file"
		fi
	done
	display_menu_options
}
exit_script(){
	read -p " would you like to save before you exit? y/n : " would_user_like_to_exit
	# this function uses the would_user_like_to_exit to match with the options in the case
	# if they match it either saves or not
	# if the input does not match then it runs the script again in a recursional way
case $would_user_like_to_exit in
	y|yes)
		save_box
		;;
	n|no) 
		exit 0
		;;
	*)
		exit_script
		;;
esac
	}


check_for_directory
display_menu_options