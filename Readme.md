<div align="center">
  <a href="https://github.com/posquit0/dotfiles" title="Shiddy's DawtFayels">
    <img alt="Shiddy's dotfiles" src="https://raw.githubusercontent.com/shiddy/dot/master/dawtimg.png?token=ADq2K9r11OARwOZ-caLO-FfmzlH-MvUZks5bNTOdwA%3D%3D"/>
  </a>
  <br/>
  <h1>Shiddy's DawtFayels</h1>
</div>

to get started on a freshy do:

    echo "I am a bad kid and I paste things from the internet into my terminal"
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    echo "Who knows what that could contain? ¯\_(ツ)_/¯"
    git clone git@github.com:shiddy/dot.git
    cd dot
    ./dotdrop.sh install -p battlestation
    echo "do ur culurs nahw"


I have color stuffs that should be dropped in ~/.color if you are of the colorful variety.


**MacOS Note**
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
