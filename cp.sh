#! /usr/bin/bash
first_arg=${PWD}/${1}
second_arg=${PWD}/${2}
if [ $# -eq 0 ]
then
	echo cp: missing file operand
	echo Try 'cp --help' for more information.
fi
if [ $# -ne 2  ]
then
	exit
fi
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
#echo $file1
#echo $file2
#echo "YESSSSSSSSSSSS"
#echo $first_arg
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
if [ -f $first_arg ]
then
	if [ -d $second_arg ]
	then
		cd $second_arg
		if [ -f $file1 ]
		then 
			rm -r $file1
			touch $file1 
			while read -r line; do
    			echo $line>>$file1
			done <$first_arg
		else
			touch $file1
			while read -r line; do
    			echo $line>>$file1
			done <$first_arg

		fi
	else
		#echo "ELSEEEE"	
		cd $arg1_path
		#echo $PWD
		touch $file2
		while read -r line; do
    		echo $line>>$file2
		done <$first_arg

	fi
elif [ -d $first_arg  ]
then
	if [ -d $second_arg ]
	then
		cd $second_arg
		ln -s  $first_arg $file1
	else
		echo "second argument not is DIR"
		exit

	fi
else
	exit

fi
