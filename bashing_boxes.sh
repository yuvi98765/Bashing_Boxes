#!/bin/bash
random_array_of_items=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
   
while true; do
	echo "1. View all items"
    echo "2. View an item by position"
    echo "3. Add a new word"
    echo "4. Delete the last word"
    echo "5. Delete a word by position"
    echo "6. Exit"
    read -p "Choose an option (1-6): " function_choice
    echo

   case  $function_choice in





1)

echo "${random_array_of_items[@]}"
;;



2)
read -p "Please enter position: " position_of_word
echo "Item at $position_of_word is: ${random_array_of_items[$position_of_word]}"
;;


3)
read -p "Please choose a word to add to the list: " user_word
 random_array_of_items+=("$user_word")
echo "${random_array_of_items[@]}"
echo "your word '$user_word' has been added to the list"
;;

4)
 unset 'random_array_of_items[-1]'
	echo "final item removed"

echo "${random_array_of_items[@]}"
;;

5)
read -p "choose The position of the word you want to delete: " user_word_delete

unset "random_array_of_items[$user_word_delete]"
echo "${random_array_of_items[@]}"
;;

6)
	exit 0


;;
esac
done

