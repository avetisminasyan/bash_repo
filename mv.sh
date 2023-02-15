#! /usr/bin/bash

if [ $# -ne 2 ]
then
	exit
fi
first_arg=${PWD}/${1}
second_arg=${PWD}/${2}
if [[ ${1:0:1} == "/" 	]]
then
	first_arg=$1
fi

if [[ ${2:0:1} == "/"	]]
then
	second_arg=$2
fi
#echo $first_arg
#echo $second_arg

IFS=/
file1=""
file2=""
for  i  in cat $first_arg
do 	
	file1=$i
done
for i in  cat $second_arg
do
	file2=$i
done
IFS=


arg1_path=""
arg2_path=""
IFS=/
for i in $first_arg
do
#	echo $i
	if [ "$i" != ${file1} ]
	then 
		arg1_path+="${i}/"
	else
		break
	fi
done
for i in $second_arg
do
#	echo $i
	if [ "$i" != ${file2} ]
	then 
		arg2_path+="${i}/"
	else
		break
	fi
done
IFS=
#echo $arg1_path
#echo $arg2_path
#echo $first_arg
#echo $second_arg
#echo "YES"
echo $file1 --n
if [ -f $first_arg ]
then	
	echo "arg1 is file"
	if [ -d $second_arg ]
	then	
		cd "$second_arg/"
		ln -P $first_arg $file1
		rm -r $first_arg
	else 
		ln -P $first_arg $file2
		rm -r $first_arg
		
	fi
else
	if [ -d $second_arg ]
	then
		cp $first_arg $second_arg

	fi
fi
