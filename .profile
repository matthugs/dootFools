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

    ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh; ssh';

    alias ls='ls --color=auto';

    alias clip='xclip -o | xclip -selection c';
    alias clap='xclip -selection c -o';
}
alias emc='emacsclient -t'

is_osx && {
    export PATH="/Users/mhughes/bin:/usr/local/bin:/usr/local/sbin:$PATH"
    ssh-add -l --apple-use-keychain > /dev/null || alias ssh='ssh-add -l --apple-use-keychain > /dev/null || ssh-add --apple-use-keychain && unalias ssh; ssh';
    # This function is for titling terminal tabs in iterm; not sure how widely
    # applicable it is.
    # nabbed from answers to https://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs
    function title {
        echo -ne "\033]0;"$*"\007"
    }
}

is_osx || {
    export PATH="/home/matt/bin:$PATH"
}

eval $(pyenv init --path)
