#/bin/bash

DEST_PATH="$HOME/.config"

if [ ! -e $DEST_PATH ]; then
    mkdir -p $DEST_PATH
    echo 'Copying conf files into $DEST_PATH...'
fi

ln -ns /scratch/nvim "${DEST_PATH}/nvim"
