# written using bash syntax
# shared configuration for either bash or zsh

# changes font size used for urxvt in current terminal
function change_font_size() {
    echo -e "\033]710;-xos4-terminus-medium-*-*-*-$1-*-*-*-*-*-iso10646-1\033\\"
}

function is_osx {
    [[ "$(uname -s)" == "Darwin" ]]
}

is_osx || {
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket";

    is_osx || ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh; ssh';

    is_osx || alias ls='ls --color=auto';

    alias clip='xclip -o | xclip -selection c';
    alias clap='xclip -selection c -o';
}
alias emc='emacsclient -t'
# Old alias for deprecated grunt task syntax for getting only my WF
# team's reviewboard requests (and no one else's)
# alias tnc-rb='grunt reviews:js:sragnarajan,hhu,rregitsky,arocha,lwallmark,sdonegan,mahughes,hpaup,mgajare,yzhou,dlacasse,jbisa,tyfitzgerald,dkhandpekar,nmorin,yozhou,rkarki,jstephens,acheng,joclee'

is_osx && {
    # This function is for titling terminal tabs in iterm; not sure how widely
    # applicable it is.
    # nabbed from answers to https://superuser.com/questions/419775/with-bash-iterm2-how-to-name-tabs
    function title {
        echo -ne "\033]0;"$*"\007"
    }
}
