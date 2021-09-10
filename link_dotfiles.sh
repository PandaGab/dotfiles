#!/bin/sh

# # Install Oh-My-Zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#######################
# Link user settings
#######################
for FILE in $(ls -A1 home); do
    FILEPATH=$HOME/$FILE
    if [[ -L $FILEPATH ]] || [[ -f $FILEPATH ]]; then
        echo "$HOME/$FILE already exists."
        read -p "Do you want to replace it? [y/n]" -n 1 -r
        echo "";  echo "" # add a blank line
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm "$HOME/$FILE"
            ln -s "${PWD}/home/$FILE" "$HOME/$FILE"
        fi
    else
        echo "Linking to $HOME/$FILE"
        ln -s "${PWD}/home/$FILE" "$HOME/$FILE"
        echo ""; echo "" # add a blank line
    fi
done

#######################
# Link vscode settings
#######################
OS=$(uname)
if [ $OS == "Linux" ]; then
    VSCODE_USER_SETTINGS_FOLDER="$HOME/.config/Code/User"
elif [ $OS == "Darwin" ]; then
    VSCODE_USER_SETTINGS_FOLDER="$HOME/Library/Application Support/Code/User"
fi

if [[ -d $VSCODE_USER_SETTINGS_FOLDER ]]; then
    for SETTINGFILE in $(ls -A1 vscode); do
        SETTINGPATH="$VSCODE_USER_SETTINGS_FOLDER/$SETTINGFILE"
        if [[ -L $SETTINGPATH ]] || [[ -f $SETTINGPATH ]]; then
            echo "$SETTINGPATH already exists."
            read -p "Do you want to replace it? [y/n]" -n 1 -r
            echo ""; echo "" # add a blank line
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                rm "$SETTINGPATH"
                ln -s "${PWD}/vscode/$SETTINGFILE" "$SETTINGPATH"
            fi
        else
            echo "Linking to ${PWD}/vscode/$SETTINGFILE"
            ln -s "${PWD}/vscode/$SETTINGFILE" "$SETTINGPATH"
            echo ""; echo "" # add a blank line
        fi
    done
else
    echo "Can't link vscode settings."
    echo "$VSCODE_USER_SETTINGS_FOLDER not found"
    echo ""; echo "" # add a blank line
fi