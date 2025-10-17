#!/bin/bash
random_array_of_random_array_of_items=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
echo "${random_array_of_items[@]}"

random_array_of_random_array_of_items+=("$user_word")

read -p "Please enter positon: " positon_of_word
echo "Item at $positon_of_word is: ${random_array_of_items[$positon_of_word]}"



read -p "Please choose a word to add to the list: " user_word
 random_array_of_items+=("$user_word")
echo "${random_array_of_items[@]}"
echo "your word '$user_word' has been added to the list"