#!/bin/bash
source pamui_errors.sh
supported_pmfs=(pacman yaourt)

echo_status_info(){
	if [ $# -gt 0 ];then
		echo "$0: $1"
	fi
}
detect_pmf(){
#pmf = packet manager frontend
	PMF="NOT_FOUND"
	n_pfms=${#supported_pmfs[*]};
	for((i=0;i<$n_pfms;i++)); do  
	#${supported_pmfs[$i]} --help # PMF=${supported_pmfs[$i]}
		type ${supported_pmfs[$i]} >/dev/null 2>&1 && { PMF=${supported_pmfs[$i]}; }
	done
	echo $PMF
}
exec_as_root(){
	if [ $# -gt 0 ];then
		type sudo >/dev/null 2>&1 && sudo_present=true
		if [ $sudo_present ];then
			sudo "$1"
		else
			echo_status_info "sudo not found. Now using su.."
			su -c " $1";
		fi
	else
		err_few_parms;
	fi
}
#safe_exec(){
#	if [ $# -gt 0 ];then
#		if [ -f $1 ];then
#			if [ -x $1 ];then
#				zenity --info --text="$1"
#				source $1
#				echo 0
#			else
#				echo 1
#			fi;
#		else
#			echo 1	
#		fi
#	else
#		echo 1 #err_few_parms;
#	fi
#}
