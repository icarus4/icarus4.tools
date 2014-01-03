#!/bin/sh

VERSION="0.0.1"
TOOLS_DIR="$( cd "$( dirname $0 )" && pwd -P )"
DOTFILE_DIR="$TOOLS_DIR/dotfiles"
BACKUP_DIR="$TOOLS_DIR/backup/`date +"%b-%d-%Y_%H:%M:%S"`"
mkdir -p "$BACKUP_DIR"

# functions
red() {
	echo -e "\033[31m${1}\033[0m"
}
green() {
	echo -e "\033[32m${1}\033[0m"
}
yellow() {
	echo -e "\033[33m${1}\033[0m"
}

# Install dot files
cd $DOTFILE_DIR
shopt -s dotglob
rcfiles=`ls *`

# Check if file is existed
cd $HOME
for file in $rcfiles; do
	if [ -f "$file" ] || [ -L "$file" ]; then
		yellow "$HOME/$file is existed"
		echo "1) Skip"
		echo "2) Overwrite"
		echo "3) backup and replace"
		echo -n ":"
		read -n1 choice; echo ""

		case $choice in
		1)
			green "Skip!"
			;;	
		2)
			#rm $file
			mv $file $BACKUP_DIR/
			ln -s $DOTFILE_DIR/$file $file
			green "Creating symbolic link ${file} ....OK"
			;;
		3)
			mv $file $BACKUP_DIR/
			ln -s $DOTFILE_DIR/$file $file
			green "Creating symbolic link ${file} ....OK"
			;;
		*)
			;;
		esac
	else
		echo "$dotfile is not existed"
	fi
done

# Finish message
echo ""
yellow " ______________________________"
yellow "/ You are using icarus4.tools \\ "
yellow "\ be productive!              /"
yellow " -----------------------------"
yellow "        \\   ^__^    v$VERSION "
yellow "         \\  (oo)\\_______"
yellow "            (__)\\       )\\/\\ "
yellow "                ||----w |"
yellow "                ||     ||"
green  "         vv  v            vv"
green  "     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo -e "\n"

