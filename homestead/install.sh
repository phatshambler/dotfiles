HOMESTEAD_DIR="~/Code/Homestead"

if [ ! -d "$HOMESTEAD_DIR" ]; then
    git clone https://github.com/FolkloreAtelier/homestead.git $HOMESTEAD_DIR
fi
