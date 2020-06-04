#!/bin/bash

Welcome () {
	echo Wecome!
	Enter_Name
}

Enter_Name () {
	Pause
	echo What is the new user"'"s first "&" last name?
	read fullName
	IFS=" "
	testarray=( \` \~ \! \@ \# \$ \% \^ \& \* \( \) \+ \= \[ \] \{ \} \ \| \: \; \' \" \< \> \? \/ \, )
		if [[ " ${testarray[*]} " =~ " ${fullName} " ]]
			then
				Invalid_Name_Messege
				Enter_Name
		else
			Validate_Name
		fi
}

Pause () {
	sleep .6s
}

Invalid_Name_Messege () {
	echo Invalid name, try again.
	sleep .5s
}

Retry_YesOrNo () {
	echo Invalid response,
	Validate_Name
}

Validate_Name () {
	IFS=" "
	yes=( Y y )
	no=( N n )
	read -a namearray <<< "$fullName"
	firstName=${namearray[0]}
	lastName=${namearray[1]}
	Pause
	echo $firstName $lastName, correct? [y/n]
	read -rsn1 checkName
		if [[ " ${yes[*]} " =~ " ${checkName} " ]]
		 	then
		 		Pause
		 		echo New username is $firstName $lastName
		elif [[ " ${no[*]} " =~ " ${checkName} " ]]
			then
				echo Try again,
				Enter_Name
		else
			Retry_YesOrNo
		fi
}

Welcome
