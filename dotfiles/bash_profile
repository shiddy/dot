# user bins I put in ~/bin
export PATH="$PATH:$HOME/bin"

# Aliases are always super personal, it helps to put them in their own place
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# I keep this .local version to keep cruft like additional $PATH changes 
# or cloud util changes from being added into git tracking
if [ -f "$HOME/.bash_profile.local"]; then
    source "$HOME/.bash_profile.local"
fi

# Sometimes you want to run tmux on a new terminal start
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi
