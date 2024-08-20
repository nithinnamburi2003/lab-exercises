#!/bin/bash

user_exists() {
        id "$1" &>/dev/null
}

is_paswd_set() {
        passwd -S "$username"
}

read -p "username: " username

if user_exists "$username"; then
        echo "user '$username' already exists"

        if is_paswd_set "$username"; then
                echo "User '$username' has a password"
        else
                echo"User '$username' does not set a password"
        fi
else
        echo"user '$username' does not exist,Creating a user"
        sudo adduser "$username"
        if [ $? -eq 0 ]; then
                echo "User '$username' created successfully."
        #       echo "Please set a password for the new user with: sudo passwd $username"
        else
                echo "Failed to create user '$username'."
        fi

fi
