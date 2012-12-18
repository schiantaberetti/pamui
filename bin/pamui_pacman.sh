#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		pacman -Ss $@ | less;
	else
		err_few_parms;
	fi
}
install_local_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "pacman -U $@";
	else
		err_few_parms;
	fi
}
install_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "pacman -S $@";
	else
		err_few_parms;
	fi
}
remove_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "pacman -R $@";
	else
		err_few_parms;
	fi
}
purge_packages(){
	if [ $# -gt 0 ];then
		exec_as_root "pacman -R --nosave $@";
	else
		err_few_parms;
	fi
}
update_db(){
	exec_as_root "pacman -Syy"
}
upgrade_packages(){
	exec_as_root "pacman -Syu"
}
search_for_file(){
	if [ $# -gt 0 ];then
		pacman -Qo $@;
	else
		err_few_parms;
	fi
}
get_source() {
	echo_status_info "This feature is not implemented yet :("
}

