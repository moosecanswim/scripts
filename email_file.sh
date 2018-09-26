#/bin/sh
#Use: 'sh email_file.sh person@site.com filetosend.txt'

echo "Checking for file and emial"
EMAIL=$1
FILE=$2


if [[ -z "${EMAIL// }" ]] || [[ -z ${FILE// } ]]
then
	echo "Enter an email followed by a file.  Example: 'sh email_file.sh person@site.com filetosend.txt' "
	printf "INPUT: \n Email:$EMAIL \n File_name: $FILE \n"
	exit 2
fi

if [ -f "$FILE" ]
then
	echo "$FILE is present in this directory"
	printf "INPUT:\nEmail:$EMAIL\nFile_name:$FILE\n"
	echo "Prepared to send"
	echo "$(cat $FILE)" | mail -s "File ($FILE) from dime jenkins" $EMAIL
	echo "Sent!"
else
	echo "$FILE is not found"
	exit 3
fi
