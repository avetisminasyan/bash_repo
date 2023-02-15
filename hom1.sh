#! /usr/bin/bash
: 'PS3="take out system info: "
select opt in c-logged-user y-shell-directory  h-directory os-Name n-users-logged avaible-shells hard-d-info cpu-info ram-info c-run-proc
do
  case $opt in
    c-logged-user)
	 ls -l /home 	    
      ;;
    y-shell-directory)
	echo $SHELL
      ;;
    h-directory)
	echo $HOME     
	 ;;
    os-Name)
	head -n 5  /etc/os-release	    
      ;;
    n-users-logged)
       who
      ;;
    avaible-shells)  
      cat /etc/shells
      ;;
    hard-d-info)
      lsblk
      ;;
    cpu-info)
      head -n 19 /proc/cpuinfo
      ;;
    ram-info)
      cat  /proc/meminfo
     ;;
    files-info)
      df-h
     ;; 
    c-run-proc)
	top
	;;	
    *)
	echo "EXIT"
	break 
	;;	
  esac
done '

# file_name=$1
# if [ -f $file_name  ]
# then
# 	echo $file_name
# else
# 	echo "NO such file or directory"
# 	exit
# fi
# file_text=$( cat $file_name  )
# rm -r $file_name
# touch $file_name
# for line in $file_text
# do	
# 	if [ -n $line ]
# 	then
# 		echo $line >>$file_name
# 	fi
# done


# then
# 	if [ -d $second_arg ]
# 	then 
# 		cd $second_arg
# 		if [ -e $f1_name  ]
# 		then
# 			rm -r $f1_name
# 			touch $f1_name
# 			while read -r line; do
#     			echo $line>>$f1_name
# 			done <$first_arg
# 		else	
# 			cd $second_arg
# 			touch $f1_name
# 			while read -r line; do
#     			echo $line>>$f1_name
# 			done <$first_arg
# 		fi
# 	elif [ -f $second_arg ]
# 	then	

# 		rm -r $second_arg
# 		mkdir $second_arg
# 		cd ..
# 		touch $f2_name
# 		while read -r line;do
# 		echo $line>>$f2_name
# 		done<$first_arg
# 	elif [ ! -f $second_arg ]
# 	then
# 		mkdir $second_arg
# 		cd ..
# 		touch $f2_name
# 		while read -r line;do
# 		echo $line>>$f2_name
# 		done <$first_arg
# 	fi

