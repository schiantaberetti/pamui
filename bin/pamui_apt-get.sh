#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		apt-cache search $@ | less;
	else
		err_few_parms;
	fi
}
install_local_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "dpkg -i $@";
	else
		err_few_parms;
	fi
}
install_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "apt-get install $@";
	else
		err_few_parms;
	fi
}
remove_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "apt-get remove $@";
	else
		err_few_parms;
	fi
}
purge_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "apt-get --purge remove $@";
	else
		err_few_parms;
	fi
}
update_db(){
	exec_as_root "apt-get update"
}
upgrade_packages(){
	exec_as_root "apt-get upgrade"
}
search_for_file(){
	if [ $# -gt 0 ];then
		apt-file search $@;
	else
		err_few_parms;
	fi
}
get_source(){
	SRC_DIR=~
	if [ $# -gt 0 ];then
		cd $SRC_DIR;
		apt-get source $@;
		echo_status_info "Source code has been downloaded in $SRC_DIR."
	else
		err_few_parms;
	fi
}


