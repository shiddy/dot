export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="jnrowe"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

You may need to manually set your language environment
export LANG=en_US.UTF-8

# User bins I put in ~/bin
export PATH="$PATH:$HOME/bin"

# If you want to run tmux at the start of your session
# if command -v tmux>/dev/null; then
#   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi

# Local is where I put aliases that are very common to me, and generally things
# that I don't mind having pushed to github
if [[ -f "${HOME}/.zshrc_local" ]]; then
    source "${HOME}/.zshrc_local"
fi

# Private is configuration of environments that I specificially DO NOT want pushed
# to github
if [[ -f "${HOME}/.zshrc_private" ]]; then
    source "${HOME}/.zshrc_private"
fi
