#/bin/bash
dest_dir="/opt"
if [ $# -gt 0 ];then
	if [ -d $1 ];then
		dest_dir=$1;
	fi
fi
if [ "$(whoami)" = "root" ]; then
	if [ ! -d $dest_dir ];then
		mkdir -p "$dest_dir/pamui"
	else
		mkdir "$dest_dir/pamui"
	fi 
	if [ -d bin ];then
		cp bin/* "$dest_dir/pamui/"
		chmod +x "$dest_dir/pamui/"
	else
		echo "Bin folder not found."
		exit 1
	fi

	#ln -s "$dest_dir/pamui/pamui.sh" /usr/local/bin/pamui
	echo "#!/bin/bash">/usr/local/bin/pamui
	echo "cd $dest_dir/pamui/">>/usr/local/bin/pamui
	echo "source pamui.sh">>/usr/local/bin/pamui
	chmod +x /usr/local/bin/pamui
	
	echo "Installation finished."
else
	echo "Sorry, you are not root."
	exit 1
fi
