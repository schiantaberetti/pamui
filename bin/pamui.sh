#!/bin/bash
#pamui = PAcket Manager Unified Interface
#pmf = packet manager frontend
source pamui_common.sh
usage(){
echo -e "Usage:\npamui [help|install|purge|remove|search|search_file|update|upgrade|install_local|source] args"
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
	num_args=$(($#))
	args=${@:2:$num_args}
	
	case $1 in 
	"search")
		search_package $args
	;;
	"install")
		install_packages $args
	;;
	"install_local")
		install_local_packages $args
	;;
	"source")
		get_source $args
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
