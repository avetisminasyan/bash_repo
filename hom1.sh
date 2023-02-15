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



