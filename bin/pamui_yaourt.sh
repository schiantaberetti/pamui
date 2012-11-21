#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		yaourt -Ss $@;
	else
		err_few_parms;
	fi
}
install_packages(){
	if [ $# -gt 0 ];then
		yaourt -S $@;
	else
		err_few_parms;
	fi
}
install_local_packages(){
	if [ $# -gt 0 ];then
		yaourt -U $@;
	else
		err_few_parms;
	fi
}
remove_packages(){
	if [ $# -gt 0 ];then
		yaourt -R $@;
	else
		err_few_parms;
	fi
}
purge_packages(){
	if [ $# -gt 0 ];then
		yaourt -R --nosave $@;
	else
		err_few_parms;
	fi
}
update_db(){
	yaourt -Syy
}
upgrade_packages(){
	NOENTER=1 yaourt -Syua --noconfirm
}
search_for_file(){
	if [ $# -gt 0 ];then
		yaourt -Qo $@;
	else
		err_few_parms;
	fi
}


