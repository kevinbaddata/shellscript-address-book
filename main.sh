#!/bin/bash
file=searchList.txt


while [ true ]; do

echo -e "-- Hello Please choose a menu below --\n\n"

echo "(1) - Search / List"
echo "(2) - Add"
echo "(3) - Remove"
echo "(4) - Edit"
echo "(q) - Quit"

read answer

case $answer in
	1)
		
        while [ true ]; do

        echo -e "Enter the information of the person you are searching for this can be\n"
		echo "- Name"
		echo "- Lastname"
		echo "- Email"
		echo "- Phone"		
		echo -e "(return to list all records)"
        echo -e "(Press (q) to go back to menu"
		read search_value

        if [ $search_value == "q" ]; then
        break
        fi
        
         lineNum=$(grep -i "$search_value" searchList.txt | wc -l) 
         echo -e "The person you were searching for has been found: $lineNum times\n"
         if [ $lineNum == 0 ]; then
         echo -e "There are no records of the contact you are searching for...\n"
		 fi
         
         if [ -z $search_value ]; then 
		 cat searchList.txt
		
		 else 
		 grep -i $search_value searchList.txt
		 fi 
		
        done
		;;
	
    2) 
        
    confirmation="n"

    while [ true ]; do
		
        echo -e "Add item, you will be prompted for 4 items:\n"
        echo -e  "- Name, Lastname, Email, Phone.\n"

        echo "- Name: "
        read name
        		
        echo "- Lastname: "
        read lastName


        echo "- Email: "
        read eMail

        echo "- Phone: "
        read phone

        echo -e "These are the infos you entered $name, $lastName, $eMail, $phone"
        echo -e "would you like to confirm the info you provided? (y/n)\n"
        read confirmation

        if [ $confirmation == "y" ]; then
                 

        echo "$name, $lastName, $eMail, $phone" >> searchList.txt
        echo "You successfuly entered your information." 
        
        break;
       
        else
        echo "You will reenter your info..."

        fi
        done
        ;;
	
    3)
		
        while [ true ]; do

        echo "Enter the information of the person you are searching for this can be"
		echo "- Name"
		echo "- Lastname"
		echo "- Email"
		echo "- Phone"
		read rm_choice

       
        lineNum2=$(grep -i "$rm_choice" searchList.txt | wc -l) 
        echo -e "The person you were searching for has been found: $lineNum2 times\n"
        if [ $lineNum2 == "0" ]; then
        echo -e "There are no records for the contact you are searching for...\n"
        
        break	    
        fi        
		
	    echo -e "$(grep -i "$rm_choice" searchList.txt)\n" 
        echo "This info will be sweeped would you like to do this (y/n):"
        read confirmation

        if [ $confirmation == "y" ]; then 

        grep -iv $rm_choice searchList.txt > searchList2.txt
		rm searchList.txt
		mv searchList2.txt searchList.txt
		
        
        else
        break
        fi
        

        done
		;;
	

    4)
	
    	
        while [ true ]; do



        echo "Enter the information of the person you are searching for this can be"
		echo "- Name"
		echo "- Lastname"
		echo "- Email"
		echo "- Phone"
		read choice
		
        lineNum3=$(grep -i "$choice" searchList.txt | wc -l) 
        echo -e "The person you were searching for has been found: $lineNum3 times\n"
        if [ $lineNum3 == 0 ]; then
        echo -e "There are no records of the contact you are searching for...\n"
        break	    
        fi
         

        
		echo -e "These are the results we found:\n"
		grep -i $choice searchList.txt
		grep -iv $choice searchList.txt > searchList2.txt
		
		echo "Would you like to edit the name?"
		oldname=`grep -i  $choice searchList.txt | cut -d "," -f 1`
		oldLastName=`grep -i  $choice searchList.txt | cut -d "," -f 2`
		oldEMail=`grep -i  $choice searchList.txt | cut -d "," -f 3`
		oldPhone=`grep -i  $choice searchList.txt | cut -d "," -f 4`

		echo "Name - [$oldname]"
		read name
		
		if [ -z "$name" ]; then
		name=$oldName
		fi
		
		echo "Lastname - [$oldLastName]"
		read lastName
		
		if [ -z "$lastName" ]; then
		lastName=$oldLastName
		fi
		
		
		echo "Email - [$oldEMail]"
		read Email
		
		if [ -z "$Email" ]; then
		Email=oldEMail
		fi
		

		echo "Phone - [$oldPhone]"
		read Phone
		
		if [ -z "$Phone" ]; then
		Phone=$oldPhone
		fi
		
		
        echo -e "$(grep -i "$choice" searchList.txt)\n" 
        echo "This info will be edited would you like to do this (y/n):"
        read confirmation2

        if [ $confirmation2 == "y" ]; then 
		

        echo "$name, $lastName, $Email, $Phone" >> searchList2.txt  
		rm searchList.txt
		mv searchList2.txt searchList.txt 
        fi
        

		done
		;;

   q)
		
		echo "See you again!"
		sleep 3
		break

		;;

  

		*)
		echo "Sorry, I don't understand"
		;;
  esac

        done

