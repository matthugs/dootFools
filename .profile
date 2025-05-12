# written using bash syntax
# shared configuration for either bash or zsh


function is_osx {
    [[ "$(uname -s)" == "Darwin" ]]
}

is_osx || {
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket";

    # changes font size used for urxvt in current terminal
    function change_font_size() {
        echo -e "\033]710;-xos4-terminus-medium-*-*-*-$1-*-*-*-*-*-iso10646-1\033\\"
    }

    alias ls='ls --color=auto';

    alias clip='xclip -o | xclip -selection c';
    alias clap='xclip -selection c -o';
}
alias emc='emacsclient -t'

is_osx && {
    export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH"
    # This function is for titling terminal tabs in iterm; not sure how widely
    # applicable it is.
    # nabbed from answers to https://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs
    function title {
        echo -ne "\033]0;"$*"\007"
    }
}

is_osx || {
    export PATH="$HOME/bin:$PATH"
    ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh; ssh';
}

# handy jq trick for converting json array into a csv
alias csvify='jq -r '\''(map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.] | tostring)) as $rows | $cols, $rows[] | @csv'\'

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
[[ -d $HOME/go ]] && export GOPATH="$HOME/go" && export PATH="$GOPATH/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
if [[ -x "$(command -v phpenv)" ]]; then
    export PATH="$HOME/.phpenv/bin:$PATH"
    eval "$(phpenv init -)"
fi
[ -s "$HOME/.cargo/env" ] && \. "$HOME/.cargo/env"

# >>> coursier install directory >>>
[[ -d "$HOME/Library/Application Support/Coursier" ]] && export PATH="$PATH:/Users/tkma6ll/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<

if [[ -d $HOME/.config/gcloud ]]; then
    export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
    export GOOGLE_CLOUD_PROJECT=kohls-bda-lle
fi

if [[ -x "$(command -v column)" ]]; then
    function csview()
    {
        local file="$1"
        cat "$file" | sed -e 's/,,/, ,/g;s/,,/, ,/g' | column -s, -t | less '-#5' -N -S
    }
fi
