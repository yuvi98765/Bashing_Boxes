#!/bin/bash
item=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
echo "${item[@]}"



read -p "Please enter position: " position
echo "Item at $position is: ${item[$position]}"



read -p "Please choose a word to add to the list: " UserWord
 item+=("$UserWord")
echo "${item[@]}"
echo "Item '$UserWord' added to list"