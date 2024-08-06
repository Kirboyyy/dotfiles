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

# KeyBindings
bindkey -s ^f "tmux-sessionizer\n"

# Alias
alias ..='cd ..'
