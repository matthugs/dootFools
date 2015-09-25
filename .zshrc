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
