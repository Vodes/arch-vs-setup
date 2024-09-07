SCRIPT_DIR=$HOME/.scripts

[[ -d $SCRIPT_DIR ]] || mkdir $SCRIPT_DIR
git clone https://github.com/Vodes/arch-vs-setup.git
mv arch-vs-setup/scripts/* $SCRIPT_DIR
rm -rf arch-vs-setup/
chmod -R u+x $SCRIPT_DIR/
printf '\nexport PATH=$PATH:$HOME/.scripts/' >> $HOME/.bash_profile
