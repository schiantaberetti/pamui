#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		err_not_yet_implemented;
	else
		err_few_parms;
	fi
}
install_packages(){
	if [ $# -gt 0 ];then
		err_not_yet_implemented;
	else
		err_few_parms;
	fi
}
install_local_packages(){
	if [ $# -gt 0 ];then
		err_not_yet_implemented;
	else
		err_few_parms;
	fi
}
remove_packages(){
	if [ $# -gt 0 ];then
		err_not_yet_implemented;
	else
		err_few_parms;
	fi
}
purge_packages(){
	if [ $# -gt 0 ];then
		err_not_yet_implemented;
	else
		err_few_parms;
	fi
}
update_db(){
	err_not_yet_implemented;
}
upgrade_packages(){
	err_not_yet_implemented;
}
search_for_file(){
	if [ $# -gt 0 ];then
		err_not_yet_implemented;
	else
		err_few_parms;
	fi
}


