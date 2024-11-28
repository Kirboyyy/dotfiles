export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

# Load environment variables
if [ -f ~/.zshenv ]; then
    source ~/.zshenv
fi

# Set paths from file
if [ -f $DOTFILES_DIR/paths ]; then
    while IFS= read -r dir; do
        eval dir="$dir"
        if [[ -d $dir ]]; then
            export PATH="$dir:$PATH"
        fi
    done < $DOTFILES_DIR/paths
fi

source $ZSH/oh-my-zsh.sh
source <(helm completion zsh)
source <(ng completion script)

# Azure CLI
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az

# KeyBindings
bindkey -s ^f "tmux-sessionizer\n"

# node version manager

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Alias
alias ..='cd ..'
alias k='kubectl'
