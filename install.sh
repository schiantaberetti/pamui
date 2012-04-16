#/bin/bash
dest_dir="/opt"
if [ $# -gt 0 ];then
	if [ -d $1 ];then
		root=$1;
	else
		root="/"
	fi
fi
if [ "$(whoami)" = "root" ]; then
	if [ ! -d $root/$dest_dir ];then
		mkdir -p "$root/$dest_dir/pamui"
	else
		mkdir "$root/$dest_dir/pamui"
	fi 
	if [ -d bin ];then
		cp bin/* "$root/$dest_dir/pamui/"
		chmod +x "$root/$dest_dir/pamui/"
	else
		echo "Bin folder not found."
		exit 1
	fi

	#ln -s "$dest_dir/pamui/pamui.sh" /usr/local/bin/pamui
	mkdir -p "$root/usr/local/bin/"
	echo "#!/bin/bash"> "$root/usr/local/bin/pamui"
	echo "cd $dest_dir/pamui/">> "$root/usr/local/bin/pamui"
	echo "source pamui.sh">> "$root/usr/local/bin/pamui"
	chmod +x "$root/usr/local/bin/pamui"
	
	echo "Installation finished."
else
	echo "Sorry, you are not root."
	exit 1
fi
