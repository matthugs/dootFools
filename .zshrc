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

if [[ -x "$(command -v pyenv)" ]]; then
    eval "$(pyenv init -)"

    if [[ -d "$(pyenv root)/plugins/pyenv-virtualenvwrapper" ]]; then
        export WORKON_HOME=$HOME/.virtualenvs
        export VIRTUALENVWRAPPER_PYTHON=/home/matt/.pyenv/shims/python3
        pyenv virtualenvwrapper
    fi
fi

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

if [[ -x "$(command -v onelogin-aws-assume-role)"  && -f ~/code/edx-internal/scripts/assume-role-onelogin.sh ]]; then
    export ONELOGIN_EMAIL="mhughes@2u.com"
    export UPDATE_PS1_ASSUME_ROLE=true
    source ~/code/edx-internal/scripts/assume-role-onelogin.sh
fi
if kubectl krew version &>/dev/null; then
    export PATH="${PATH}:${HOME}/.krew/bin"
fi

if [[ -x "$(command -v dscl)" ]]; then
    ad-get-users-groups () {
        local user=${1:?"No Username Provided/"};
        dscl '/Active Directory/2TOR/All Domains' read "/Users/${user}" dsAttrTypeNative:memberOf | \
            ( read -r;
              printf "%s\n" "$REPLY";
              sort -f )
    }

    ad-get-group-members () {
        local group=${1:?"No Group Provided/"};
        dscl '/Active Directory/2TOR/All Domains' read "/Groups/${group}" GroupMembership | \
            ( read -r;
              printf "%s\n" "$REPLY";
              sort -f )
    }
fi
