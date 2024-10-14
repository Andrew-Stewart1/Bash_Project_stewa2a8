#!/bin/bash

#Offers the option to increase password Complexity and length and then determines the character set used to generate the password based off those parameters
echo "Please select the Password Complexity"
read pass_Comp
echo "Please enter the password length, the default is 15 characters long."
read pass_len
charSet=""

#If no length is set default to NIST recommandation of 15 characters
if [[ -z "$pass_len" ]]; then
passLen=15
fi

#Check the complexity that was set by user
if [[ $pass_Comp == 1 ]]; then
charSet="a-zA-Z"
elif [[ $pass_Comp == 2 ]]; then
charSet="a-zA-Z0-9!#$"
elif [[ $pass_Comp == 3 ]]; then
charSet="a-zA-Z0-9!@#$%^&*()-_+=:;'"/?.>,<{[|}]|\`~"
else 
charSet="a-zA-Z0-9!@#$%^&*()-_+=:;'"/?.>,<{[|}]|\`~"
fi

tr $charSet </dev/urandom | head -c $pass_len;
echo ''
