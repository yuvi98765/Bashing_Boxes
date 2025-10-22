#!/bin/bash
# 1) delaire all needed variables
# 2) define all functions
# 3) start main logic

random_array_of_items=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
   
display_menu_options(){
	echo " 
	1. View all items
	2. View an item by position
	3. Add a new word
	4. Delete the last word
	5. Delete a word by position
	6. Exit"
    read -p "Choose an option (1-6): " function_choice
    check_user_iput
}



check_user_iput(){
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
		6|exit)
			exit_script
			;;
		*)
			display_menu_options
			;;
	esac
}
#done
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
exit_script(){
			exit 0
}
display_menu_options