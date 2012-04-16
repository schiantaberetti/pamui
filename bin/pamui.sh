#!/bin/bash
#pamui = PAcket Manager Unified Interface
#pmf = packet manager frontend
source pamui_common.sh
usage(){
echo -e "Usage:\n$0 [help|install|purge|remove|search|search_file|update|upgrade] args"
}

PMF=$(detect_pmf)
pmf_lib="pamui_$PMF.sh"
if [ -x $pmf_lib ]; then
	source $pmf_lib;
else
	err_no_method_lib;
	exit 1;
fi

if [ $# -gt 0 ];then
	if [ $# -gt 1 ];then
		args=$2
		for((i=3;i<$#;i++)); do
			args="$args ${i}"
		done
	fi
		
	case $1 in 
	"search")
		search_package $args
	;;
	"install")
		install_packages $args
	;;
	"purge")
		purge_packages $args	
	;;
	"remove")
		remove_packages $args
	;;
	"update")
		update_db
	;;
	"upgrade")
		upgrade_packages
	;;
	"search_file")
		search_for_file $args
	;;
	*)
		usage
	;;
	esac

else
	usage
fi
