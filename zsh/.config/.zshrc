eval "$(/opt/homebrew/bin/brew shellenv)"

#set history size
export HISTSIZE=50000
#save history after logout
export SAVEHIST=50000
#history file
export HISTFILE=~/.zhistory
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
#add timestamp for each entry
setopt EXTENDED_HISTORY

##################
# Terraform Crap #
##################
autoload -Uz compinit && compinit
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
source $(brew --prefix)/etc/bash_completion.d/az

__azure_resource_pp () {
  echo "resource \"$1\" \"\" {"
  # to_entries: Converts the object into an array of key-value pairs, where each key-value pair is represented as an object with key and value properties.
  jq --arg resource "$1" '.provider_schemas."registry.terraform.io/hashicorp/azurerm".resource_schemas[$resource].block.attributes' ~/tmp/az_schema | jq -r 'to_entries | map(select(.value.required == true)) | .[] | "\(.key) = \"\""' | column -t | sed -E 's/^/  /'
  echo "}"
}

__azure_resource_search () {
  jq --arg resource "$1" '.provider_schemas."registry.terraform.io/hashicorp/azurerm".resource_schemas[$resource].block.attributes' ~/tmp/az_schema
}

alias aztf_search="jq -r '.provider_schemas.\"registry.terraform.io/hashicorp/azurerm\".resource_schemas | keys[]' ~/tmp/az_schema | grep"
alias aztf_resource="__azure_resource_search "
alias aztf_pp="__azure_resource_pp "
alias aztf_docs="echo \'https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs\'"

#############
# Deno Crap #
#############
export DENO_INSTALL="/Users/user/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#################
# Starship Crap #
#################
eval "$(starship init zsh)"

#############
# Misc Crap #
#############
alias starp="fold -sw 28 | lp -o print-quality=5 -d Star"

export PATH=$PATH:~/.local/share/nvim/mason/bin

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"

. "$HOME/.local/bin/env"
