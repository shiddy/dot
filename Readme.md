# Shiddy's DawtFayels

I started to use dotdrop to do the moving of the dotfiles
from this repo to their respective locations within my host OS.

This requires the use of submodules within this repo as well as some other
tools on the system; namely python3 & pip3

to get started on a fresh box do:

    git clone git@github.com:shiddy/dot.git
    cd dot
    git submodule update --init
    python3 -m venv venv
    source venv/bin/activate
    pip3 install --user -r dotdrop/requirements.txt
    ln -s dotdrop/dotdrop.sh dotdrop.sh


    echo "please run one of the following: "
    echo "   ./dotdrop.sh -p zsh-neovim install"

    echo "\n I also recommend installing bash-completion if you have not already done so"


If changes are made to your local dotfiles, you can import them into the apropriate profile with

    ./dotdrop.sh -p zsh-neovim import ~/.zshrc

I have color stuff that should be dropped in ~/.color if you are of the colorful variety.

**MacOS Note**

If you want to run dotdrop on macos you will have to `brew install coreutils` for `realpath` to function

If you are using the default terminal, you will have to update the keybindings under your profile to contain the modifier keys for tmux hotkeys to function as expected. I.E.

```
Shift + Cursor Up     \033[1;2A
Shift + Cursor Down   \033[1;2B
Shift + Cursor Right  \033[1;2C
Shift + Cursor Left   \033[1;2D

Mod   + Cursor Up     \033[1;3A
Mod   + Cursor Down   \033[1;3B
Mod   + Cursor Right  \033[1;3C
Mod   + Cursor Left   \033[1;3D
```
