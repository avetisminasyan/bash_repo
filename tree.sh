#! /usr/bin/bash
func_m (){
for content in $1/*
do
       	if [ -d $content ]
	then	dir_c=$(( $dir_c +1 ))
		if [ ! `ls -A $content/ | wc -m` == "0" ];
		then	
			d="$(basename -- $content)"
			echo -e "$|$a$d --THis is directory"
			a+="-"
   			func_m $content
#			echo "THis is not empy dir $content  "
			a="${a::-1}"
		fi
	else	file_c=$(( $file_c +1  ))
		f="$(basename -- $content)"
		echo -e  "|$a$f"
	fi
done
}
#func_m $PWD
main(){
a="-"
dir_c=0
file_c=0
func_m $PWD
echo "${dir_c}-directories,${file_c}-files"
}
main
