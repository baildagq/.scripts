# read -p "input filepath: " FILE
for line in `cat $1`
do
    sudo pacman -S --noconfirm $line
done
