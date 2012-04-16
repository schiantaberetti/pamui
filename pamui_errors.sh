#/bin/bash
err_few_parms(){
	echo "You passed less parameters than expected."
}
err_no_packman_detected(){
	echo "No known packet manager frontend detected."
}
err_no_method_lib() {
	echo "Library not found for your packet manager frontend."
}
err_not_implemented() {
	echo "Sadly this function is not yet implemented."
}
