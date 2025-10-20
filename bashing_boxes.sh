#!/bin/bash

while true; do
random_array_of_items=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
echo "${random_array_of_items[@]}"



read -p "Please enter position: " position_of_word
echo "Item at $position_of_word is: ${random_array_of_items[$position_of_word]}"



read -p "Please choose a word to add to the list: " user_word
 random_array_of_items+=("$user_word")
echo "${random_array_of_items[@]}"
echo "your word '$user_word' has been added to the list"

read -p "you wanna delete the last word in the list  y/n: " function_four_yes_no
if [[ $function_four_yes_no = n ]]; then
	
echo "Okay bye"
exit 0

else  unset 'random_array_of_items[-1]'
	echo "final item removed"
fi
echo "${random_array_of_items[@]}"


read -p "choose The position of the word you want to delete: " user_word_delete

unset "random_array_of_items[$user_word_delete]"
echo "${random_array_of_items[@]}"


read -p "Would you like to exit the script y/n : " exit_y_n
if [[ $exit_y_n = y ]]; then
	exit 0
fi
done

