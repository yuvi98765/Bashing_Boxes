#!/bin/bash
# 1) delaire all needed variables
# 2) define all functions
# 3) start main logic
data_directory="./data"
random_array_of_items=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")

check_for_directory(){
if [ ! -d "$data_directory" ]; then
	mkdir "$data_directory"
fi
}

   
display_menu_options(){
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
	

    read -p "Choose an option (1-8): " function_choice
    check_user_input
}





check_user_input(){
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
			echo "${random_array_of_items[@]}"
			display_menu_options
}
print_item_at_x_position(){
	read -p "Please enter position 0-9 : " position_of_word
			echo "Item at $position_of_word is: ${random_array_of_items[$position_of_word]}"
			display_menu_options
}
print_new_item(){
	read -p "Please choose a word to add to the list: " user_word
			 random_array_of_items+=("$user_word")
			echo "${random_array_of_items[@]}"
			echo "your word '$user_word' has been added to the list"
			display_menu_options
}
unset_last_item(){
	unset 'random_array_of_items[-1]'
			echo "final item removed"
			echo "${random_array_of_items[@]}"
			display_menu_options
}
delete_word_by_position(){
	read -p "choose The position of the word you want to delete: " user_word_delete
			unset "random_array_of_items[$user_word_delete]"
			echo "${random_array_of_items[@]}"
			display_menu_options
}
save_box(){
	read -p " What would you like to name this save file?: " user_save_file_name
	filepath="$data_directory/$user_save_file_name.box"
{
echo "saved_items=(${random_array_of_items[@]@Q})"
} > "$filepath"
echo "Box saved to $filepath"
}
load_box(){
	read -p "please write the name of the box you would load: " user_load_box
	filepath="$data_directory/$user_load_box.box"
	if [ -f "$filepath" ]; then
		source "$filepath"
		random_array_of_items=("${saved_items[@]}")
		echo " ' $user_load_box ' loaded "
		echo "current items: ${random_array_of_items[@]}"
	else
		echo "Invalid filename"
	fi
	display_menu_options
}
list_boxes() {
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