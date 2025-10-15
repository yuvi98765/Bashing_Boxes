#!/bin/bash
item=("Peanut butter" "Shawl" "Cargo ship" "Wallet" "Xylophone" "Medicine cabinet" "Apron" "Washing machine" "Tree stump" "Milkshake")
echo "${item[@]}"



read -p "Please enter position: " pos
echo "Item at $pos is: ${item[$pos]}"



read -p "Please choose a word to add to the list: " word
 item+=("$word")
echo "${item[@]}"
echo "Item '$word' added to list"