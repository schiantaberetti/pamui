#/bin/bash
source pamui_errors.sh
source pamui_common.sh
search_package(){
	if [ $# -gt 0 ];then
		yaourt --color -Ss $@ | less -r;
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
get_source() {
	if [ $# -gt 0 ];then
		SRC_DIR=~
		cd $SRC_DIR
		yaourt -G $@
		for pkg in "$@"; do
			if [ -d $pkg ]; then
				cd $pkg
				makepkg --nobuild
				if [ $? -eq 0 ];then
					echo_status_info "Source downloaded in $SRC_DIR/$pkg"
				else
					echo_status_info "Error with the source code."
				fi
				cd $SRC_DIR
			else
				echo_status_info "Packet not found.."
			fi
		done
	else
		err_few_parms;
	fi
}


