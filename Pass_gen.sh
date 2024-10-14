#!/bin/bash

#Offers the option to increase password Complexity and length and then determines the character set used to generate the password based off those parameters
echo "Please select the Password Complexity 1-5 - (The default value is 3 - If help is needed type -h now)"
read pass_Comp
echo "Please enter the password length - (The default is 15 characters long):"
read pass_len
charSet=""
#If no complexity is set default to the middle at 3 
if [[ -z "$pass_Comp" ]]; then
pass_Comp=3
fi
#If no length is set default to NIST recommandation of 15 characters
if [[ -z "$pass_len" ]]; then
pass_len=15
fi
#Adding in a help function 
if [ "$pass_Comp" == "-h" ]; then
  echo "Usage: Generate a random password. Please input a valid Complexity value of 1-5 and a length greater than 0"
  exit 0
fi
#Define the output file for later use
output="random_pass.txt"

#Check the complexity that was set by user
if [[ $pass_Comp == 1 ]]; then
charSet="a-zA-Z"
elif [[ $pass_Comp == 2 ]]; then
charSet="a-zA-Z0-9"
elif [[ $pass_Comp == 3 ]]; then
charSet="a-zA-Z0-9!#$"
elif [[ $pass_Comp == 4 ]]; then
charSet="a-zA-Z0-9!@#$%^)*("
elif [[ $pass_Comp == 5 ]]; then
charSet="a-zA-Z0-9!@#$%^&)*(-_+=:;'/?.}{]|\[`~ "
    else 
charSet="a-zA-Z0-9!@#$%^&)*(-_+=:;'/?.}>,<|{]|\[`~ "
fi

#Echo a message to indicate when the password is provided and explain where is gets stored. Tee is used to type the file to the script
echo "Your password was generated with a complexity of $pass_Comp and a length of $pass_len. This is your random password:"
tr -dc $charSet </dev/urandom | head -c "$pass_len" | tee -a "$output"
echo '' | tee -a "$output"
echo "Your random passsword is stored in the random_pass.txt file"
