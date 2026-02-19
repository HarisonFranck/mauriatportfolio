# .zshrc
export PATH="/usr/local/bin:$PATH" 
# rbenv init
eval "$(rbenv init - zsh)"

# Flutter
export PATH="$HOME/Desktop/development/flutter/bin:$PATH"

# Java
export JAVA_HOME=$(/usr/libexec/java_home -v 17.0.2)
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

# Alias pratiques (optionnel, selon ton envie)
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Added by Antigravity
export PATH="/Users/rinasonya/.antigravity/antigravity/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"

# Load Angular CLI autocompletion.
source <(ng completion script)
