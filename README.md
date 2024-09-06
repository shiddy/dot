# Shiddy's Dotfiles

Now with [GNU Stow!](https://www.gnu.org/software/stow/)

## Installation

You will need to keep this repo in your $HOME, otherwise stow does not handle paths well... this is clearly a me problem, but I am not interested in debugging this more than I am interested in having it work consistently. ┐('～';)┌

```
cd ~
git clone https://github.com/shiddy/dot.git
```

(or ssh if you are into that)


Then you simply select the resource you want to deploy e.g.

```
stow tmux
```

This will make a symlink to it's expected location to the repository. Updates should be easy peasy.
