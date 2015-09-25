# written using bash syntax
# shared configuration for either bash or zsh

# changes font size used for urxvt in current terminal
function change_font_size() {
    echo -e "\033]710;-xos4-terminus-medium-*-*-*-$1-*-*-*-*-*-iso10646-1\033\\"
}


export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
#currently wrong: the mode setting in probably unnecessary and will break if not
# the same monitor as in the TA lab

ssh-add -l > /dev/null || alias ssh='ssh-add -l > /dev/null || ssh-add && unalias ssh; ssh'

alias ls='ls --color=auto'

