#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		query=$1
		for((i=2;i<$#;i++)); do
			query="$query ${i}"
		done
		apt-cache search $query;
	else
		err_few_parms;
	fi
}
install_packages(){
	if [ $# -gt 0 ];then
		query=$1
		for((i=2;i<$#;i++)); do
			query="$query ${i}"
		done
		exec_as_root "apt-get install $query";
	else
		err_few_parms;
	fi
}
remove_packages(){
	if [ $# -gt 0 ];then
		query=$1
		for((i=2;i<$#;i++)); do
			query="$query ${i}"
		done
		exec_as_root "apt-get remove $query";
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
		err_not_implemented;
	else
		err_few_parms;
	fi
}


