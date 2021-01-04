HOMESTEAD_DIR="~/Code/Homestead"

if [ ! -d "$HOMESTEAD_DIR" ]; then
    git clone https://github.com/folkloreinc/homestead.git $HOMESTEAD_DIR
fi
