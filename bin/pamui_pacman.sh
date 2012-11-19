#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		query=$1
		for((i=2;i<$#;i++)); do
			query="$query ${i}"
		done
		pacman -Ss $query;
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
		exec_as_root "pacman -S $query";
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
		exec_as_root "pacman -R $query";
	else
		err_few_parms;
	fi
}
purge_packages(){
	if [ $# -gt 0 ];then
		query=$1
		for((i=2;i<$#;i++)); do
			query="$query ${i}"
		done
		exec_as_root "pacman -R --nosave $query";
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
		pacman -Qo $1;
	else
		err_few_parms;
	fi
}


