#!/bin/sh

VERSION="0.0.2"
TOOLS_DIR="$( cd "$( dirname $0 )" && pwd -P )"
DOTFILE_DIR="$TOOLS_DIR/dotfiles"
SCRIPT_DIR="$TOOLS_DIR/install_scripts"
BACKUP_DIR="$TOOLS_DIR/backup/`date +"%b-%d-%Y_%H:%M:%S"`"
mkdir -p "$BACKUP_DIR"

COMMON_DEF="$SCRIPT_DIR/common_def"

# source common functions & variables
[[ -f $COMMON_DEF ]] && . $COMMON_DEF || ( echo "Cannot find common define fine, exit" && exit 1 )

# Install dot files
cd $DOTFILE_DIR
shopt -s dotglob
rcfiles=`ls *`

# Check if file is existed
cd $HOME
for file in $rcfiles; do
	if [ -f "$file" ] || [ -L "$file" ]; then
		_yellow "$HOME/$file is existed"
		echo "1) Skip"
		echo "2) Overwrite"
		echo "3) backup and replace"
		echo -n ":"
		read -n1 choice; echo ""

		case $choice in
		1)
			_green "Skip!"
			;;	
		2)
			#rm $file
			mv $file $BACKUP_DIR/
			ln -s $DOTFILE_DIR/$file $file
			_green "Creating symbolic link ${file} ....OK"
			;;
		3)
			mv $file $BACKUP_DIR/
			ln -s $DOTFILE_DIR/$file $file
			_green "Creating symbolic link ${file} ....OK"
			;;
		*)
			;;
		esac
	else
		echo "$dotfile is not existed"
	fi
done

# Finish message
_print_finish_message

