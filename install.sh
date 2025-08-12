# i'm not running this automatically as i'm just that unsure about myself, it's better to just copy/symlink the files and whatever
exit

cp emacs/ spicetify/ kitty/ fastfetch/ dinit.d/ ~/.config/
cp wallpapers/ ~/Pictures
mkdir ~/.fonts/
cp fonts/* ~/.fonts/
cp zshrc ~/.zshrc
cat gnome.ini | dconf load /
