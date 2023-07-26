#!/bin/bash

# Declare read-only associative array
declare -Ar animals=(
    ["dog"]="Woof"
    ["cat"]="Meow"
    ["bird"]="Chirp"
)

# Retrieve and display elements
echo "Dog sound: ${animals[dog]}"
echo "Cat sound: ${animals[cat]}"
echo "Bird sound: ${animals[bird]}"

# Display all keys and values in the associative array
for key in "${!animals[@]}"; do
    echo "Key: $key, Value: ${animals[$key]}"
done
