# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob nomatch notify
unsetopt autocd beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/matt/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

bindkey '^R' history-incremental-pattern-search-backward

fpath=($fpath ~/.zsh/funcs)

autoload -Uz git-escape-magic
git-escape-magic
autoload bashcompinit
bashcompinit

eval "$(pyenv init -)"

export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
export PATH="/usr/local/opt/mysql-client/bin:$PATH"

if [[ -x "$(command -v onelogin-aws-assume-role)"  && -f ~/code/edx-internal/scripts/assume-role-onelogin.sh ]]; then
      export ONELOGIN_EMAIL="mhughes@edx.org"
      export UPDATE_PS1_ASSUME_ROLE=true
      source ~/code/edx-internal/scripts/assume-role-onelogin.sh
fi
if kubectl krew version &>/dev/null; then
    export PATH="${PATH}:${HOME}/.krew/bin"
fi
