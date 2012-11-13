#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		query=$1
		for((i=2;i<$#;i++)); do
			query="$query ${i}"
		done
		yaourt -Ss $query;
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
		yaourt -S $query;
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
		yaourt -R $query;
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
		yaourt -R --nosave $query;
	else
		err_few_parms;
	fi
}
update_db(){
	yaourt -Syy
}
upgrade_packages(){
	yaourt -Sua --noconfirm
}
search_for_file(){
	if [ $# -gt 0 ];then
		yaourt -Qo $1;
	else
		err_few_parms;
	fi
}


